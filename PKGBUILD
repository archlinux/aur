# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=x-create-mouse-void-git
_gitname=XCreateMouseVoid
pkgver=r6.684badc
pkgrel=1
pkgdesc="Creates an undecorated black window and prevents the mouse from entering that window."
arch=(i686 x86_64)
url=https://github.com/cas--/XCreateMouseVoid
license=(unknown)
depends=(libx11)
provides=(x-create-mouse-void)
conflicts=(x-create-mouse-void)
source=(git+https://github.com/cas--/XCreateMouseVoid)
sha256sums=(SKIP)


pkgver() {
  cd "$_gitname"
  commit=$(git rev-list --count master)
  hash=$(git rev-parse --short HEAD)
  echo "r$commit.$hash"
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  install -Dm755 XCreateMouseVoid "$pkgdir"/usr/bin/x-create-mouse-void
}
