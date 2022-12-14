_pkgname=glogg
pkgname=$_pkgname-git
pkgver=v1.1.4.71.ge191a637
pkgrel=1
pkgdesc="Multi-platform GUI application that helps browse and search through long and complex log files"
arch=('x86_64')
url="https://github.com/nickbnf/glogg"
license=('GPL-3.0')
groups=()
depends=('qt5-base' 'boost-libs' 'hicolor-icon-theme')
makedepends=('git' 'boost')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=()
source=("$_pkgname::git+https://github.com/nickbnf/glogg.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  qmake
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="$pkgdir/usr/" install
}
