# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname='pipdeptree'
pkgver=2.2.1
pkgrel=1
pkgdesc="Command line utility to show dependency tree of Python packages"
url="https://github.com/naiquevin/${pkgname}"
depends=('python-pip')
optdepends=('graphviz: for generating graphical output')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2b97d80c64d229e01ad242f14229a899263c6e8645c588ec5b054c1b81f3065d')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --skip-build --optimize=1
  # install documentation
  install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  # install license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
