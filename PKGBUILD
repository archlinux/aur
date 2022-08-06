# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-gtk-themes-git
pkgbase=piscesde-gtk-themes
_pkgname=piscesde-gtk-themes
pkgver=0
pkgrel=2
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

build() {
  cd gtk-themes

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd gtk-themes
  make DESTDIR="$pkgdir" install
}
