# Maintainer: Robin Broda <coderobe at archlinux dot org>

pkgname=python-xtarfile
pkgver=0.0.4
pkgrel=2
pkgdesc='Wrapper around tarfile to add support for more compression formats'
arch=('any')
url=https://github.com/ascoderu/xtarfile
license=('Apache')
depends=('python-zstandard')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/x/xtarfile/xtarfile-$pkgver.tar.gz")
sha256sums=('abaf87e34f23b9da85368defe4701fda043d1816f396ec330d27c5d77ad9a710')

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
