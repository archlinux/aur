# Maintainer: Mm2PL <mm2pl plus (shorthand for Arch User Repository) at kotmisia period pl>
pkgname=justgrep-git

pkgver=r53.157f652

pkgrel=1
pkgdesc='Tool for searching justlog logs and manipulating IRC messages'
arch=('any')
url="https://github.com/Mm2PL/justgrep"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go')
provides=('irc2json' 'justgrep')
conflicts=()
options=('zipman')
source=('justgrep::git://github.com/Mm2PL/justgrep.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/justgrep"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/justgrep"

  make
}

package() {
  cd "$srcdir/justgrep"

  make DESTDIR="$pkgdir/" install
}
