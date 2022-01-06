# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=folder-color-nemo
_pkgname=${pkgname%-nemo}
pkgver=0.0.90
pkgrel=1
pkgdesc="Change your folder color in Nemo"
arch=('any')
url="https://github.com/costales/folder-color"
license=('GPL3')
depends=('folder-color-common' 'nemo' 'nemo-python')
makedepends=('git' 'python-distutils-extra')
_commit=e76d1d92e2d1418fa1dcd3f418a8919a2842140d
source=("git+https://github.com/costales/folder-color.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname/install_scripts"
  ./nemo.sh
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
