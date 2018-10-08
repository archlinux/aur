# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=('pipdeptree')
pkgver='0.13.1'
pkgrel=1
pkgdesc="Command line utility to show dependency tree of Python packages"
url="https://github.com/naiquevin/${pkgname}"
depends=('python-pip')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('3315f0878b3bd75ce9bd46f17418e6dc')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --skip-build --optimize=1
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
