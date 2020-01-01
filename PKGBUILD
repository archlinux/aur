# Maintainer: Robin Broda <coderobe at archlinux dot org>

pkgname=python-xtarfile
pkgver=0.0.3
pkgrel=1
pkgdesc='Wrapper around tarfile to add support for more compression formats'
arch=('any')
url=https://github.com/ascoderu/xtarfile
license=('Apache')
depends=('python-zstandard')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/x/xtarfile/xtarfile-$pkgver.tar.gz")
sha256sums=('c4e93184794555917465567bd8746abea5cb8e3435b699e371eab1df0174f2e2')

build() {
  cd xtarfile-$pkgver
  python setup.py build
}

check() {
  cd xtarfile-$pkgver
  python setup.py test
}

package() {
  cd xtarfile-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
