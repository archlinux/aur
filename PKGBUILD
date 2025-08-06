# Maintainer: Kutay Gumusbas <kutaygb@protonmail.com>
pkgname=terminal-rain-lightning-c-git
pkgver=aaba4ff
pkgrel=1
pkgdesc="A terminal rain and lightning animation written in C using ncurses"
arch=('x86_64' 'i686')
url="https://github.com/Kutaygb/terminal-rain-lightning-c"
license=('MIT')
depends=('ncurses')
makedepends=('git' 'gcc' 'make')
provides=('terminal-rain-lightning-c')
conflicts=('terminal-rain-lightning-c')
source=("git+https://github.com/Kutaygb/terminal-rain-lightning-c.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/terminal-rain-lightning-c"
  git describe --tags --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/terminal-rain-lightning-c"
  gcc rain.c -lncurses -o terminal-rain
}

package() {
  cd "$srcdir/terminal-rain-lightning-c"
  install -Dm755 terminal-rain "$pkgdir/usr/bin/terminal-rain"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

