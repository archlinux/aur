# Maintainer: Zeners <zener at sbg dot at>
# Contributor: Olaf Leidinger <oleid at mescharet dot de>

pkgname=gnome-shell-extension-teatime
_gitname=gnome-shell-teatime
pkgrel=1
pkgdesc="A tea drawing timer for the gnome-shell"
arch=('any')
url="https://github.com/zeners/gnome-shell-teatime"
license=('GPL')
depends=('gnome-shell>=1:47')
makedepends=('git' 'intltool' 'glib2' 'gnome-common')
source=("git+${url}")
pkgver=47.0.r0.g
pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh 
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

sha256sums=('SKIP')
