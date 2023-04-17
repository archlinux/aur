# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=widgie-git
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight widget library for applications which do not need a splashscreen."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/manner/widgie"
license=('GPL3')
conflicts=('widgie')
provides=('widgie')
depends=()
optdepends=("ttf-nerd-fonts-symbols-1000-em: (or a nerd font) for icon support")
makedepends=(wayland-protocols wayland libxkbcommon freetype2 libxkbcommon-x11 libxcb xcb-util-image xorgproto)
source=("git+https://gitlab.com/manner/widgie")
sha256sums=(SKIP)
_reponame=widgie

pkgver() {
    cd "$srcdir/$_reponame"
    git describe --tags | sed -e 's,-,.,g'
}

build() {
  cd "$srcdir/$_reponame"
  make 
}

package() {
  cd "$srcdir/$_reponame"
  make DESTDIR="$pkgdir/usr" install
}
