# Maintainer: horix <houruinus@gmail.com>

_pkgname=kmines-classic-dark
pkgname=kmines-classic-dark-git
pkgrel=1
pkgver=1.0.r0.g6bb3632
pkgdesc="A dark variant of KMines classic theme"
arch=('any')
url="https://github.com/Hou-Rui/kmines_classic_dark"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'sed' 'kmines')
optdepends=()
provides=()
conflicts=()
backup=()
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  _install_dir="$pkgdir/usr/share/kmines/themes/"
  mkdir -p "$_install_dir"
  cp ./classic_dark_preview.png "$_install_dir"
  cp ./classic_dark.desktop "$_install_dir"
  cp ./kmines_classic_dark.svg "$_install_dir"
}
