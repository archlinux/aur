# Maintainer: Olaf Leidinger <oleid@mescharet.de>

pkgname=gnome-shell-extension-teatime
_gitname=gnome-shell-teatime
pkgrel=1
pkgdesc="A tea drawing timer for the gnome-shell"
arch=('any')
url="https://github.com/oleid/gnome-shell-teatime"
license=('GPL')
depends=('gnome-shell')
makedepends=('git' 'intltool' 'glib2' 'gcc' 'perl')
source=("git${url#https}.git")
pkgver=81.3e6ad50
pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
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
