# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-gtk-themes-git
_pkgname=cutefish-gtk-themes
pkgver=0.7.r0.g91f762f
pkgrel=1
pkgdesc="Cutefish gtk dark/light themes"
arch=('any')
url="https://github.com/cutefishos/gtk-themes"
license=('GPL')
groups=('cutefish-git')
depends=()
makedepends=('extra-cmake-modules' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd gtk-themes
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd gtk-themes

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd gtk-themes
  make DESTDIR="$pkgdir" install
}
