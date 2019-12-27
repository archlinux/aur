# Maintainer: Robin Broda <coderobe at archlinux dot org>

pkgname=python-xtarfile
pkgver=0.0.2
pkgrel=1
pkgdesc='Wrapper around tarfile to add support for more compression formats'
arch=('any')
url=https://github.com/ascoderu/xtarfile
license=('Apache')
depends=('python-zstandard')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/x/xtarfile/xtarfile-$pkgver.tar.gz")
sha256sums=('592c86932e8df7d08ca36b13a666af119908ededb139d77d122f6a6776142dfa')

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
