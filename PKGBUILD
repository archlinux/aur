# Maintainer: Robin Broda <coderobe at archlinux dot org>

pkgname=python-xtarfile
pkgver=0.1.0
pkgrel=1
pkgdesc='Wrapper around tarfile to add support for more compression formats'
arch=('any')
url=https://github.com/ascoderu/xtarfile
license=('Apache')
depends=('python-zstandard' 'python-lz4')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/x/xtarfile/xtarfile-$pkgver.tar.gz")
sha256sums=('604c52efa2736944d724184cd0d669909b78400240a09f4a98a17fb9712420da')

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
