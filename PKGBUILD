# Maintainer: Marcel Robitaille mail@marcelrobitaille.me
pkgname=lemonbar-dark-yux-git
pkgver=r254.08de101
pkgrel=2
pkgdesc="bar aint recursive - A lightweight xcb based bar. This is a fork that supports fontconfig and borders \\w color."
arch=('any')
url="https://github.com/dark-yux/bar"
license=('MIT')
depends=()
makedepends=('git')
provides=('lemonbar')
conflicts=('lemonbar' 'lemonbar-xft-git')
source=('lemonbar-dark-yux-git::git+https://github.com/dark-yux/bar')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  install -D -m 755 lemonbar ${pkgdir}/usr/bin/lemonbar
  install -D -m 644 lemonbar.1 ${pkgdir}/usr/share/man/man1/lemonbar.1
}

