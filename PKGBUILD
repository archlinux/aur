# Maintainer: Jakariya Abbas <jakariya3460@gmail.com>
pkgname=xfce4-panel-darkman-git
pkgver=1.0.r0.g0000000
pkgrel=1
pkgdesc="DarkMan theme plugin for Xfce panel (builds from git)"
arch=('x86_64')
url="https://github.com/jakariyaa/xfce4-panel-darkman"
license=('GPL')
depends=('xfce4-panel')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'pkg-config' 'vala' 'gtk-doc' 'intltool')
source=("git+https://github.com/jakariyaa/xfce4-panel-darkman.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/xfce4-panel-darkman"
  printf "%s" "$(git rev-list --count HEAD).r$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/xfce4-panel-darkman"
  autoreconf -fi
}

build() {
  cd "$srcdir/xfce4-panel-darkman"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/xfce4-panel-darkman"
  make DESTDIR="$pkgdir" install
}
