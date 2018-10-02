# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=pip-autoremove
pkgver=0.9.1
pkgrel=1
pkgdesc="Remove a python package and its unused dependencies."
url="https://github.com/invl/pip-autoremove"
depends=('python-pip')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('dce79dcf61458b05c99024b5f8f15370')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --skip-build --optimize=1
}

# vim:set ts=2 sw=2 et:
