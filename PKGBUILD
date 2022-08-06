# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-gtk-themes-git
_pkgname=piscesde-gtk-themes
pkgver=0.9
pkgrel=1
pkgdesc="piscesDE gtk dark/light themes"
arch=('any')
url="https://github.com/piscesys/gtk-themes"
license=('GPL')
groups=('piscesde-git')
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
