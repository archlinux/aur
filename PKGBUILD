pkgname=sheet-git
pkgver=r6.4b5d1a3
pkgrel=1
pkgdesc="sheet is a minimal(ish) tui frontend for feh/swaybg"
arch=(x86_64)
url="https://codeberg.org/unixextremist/sheet"
license=('WTFPL')
depends=(ncurses)
optdepends=(
   'viu: for image preview'
   'feh: Needs either feh or swaybg to work'
   'swaybg: Needs either feh or swaybg to work'
)
source=("$pkgname::git+https://codeberg.org/unixextremist/sheet.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  }

build() {
	cd "$pkgname"
	cc sheet.c -o sheet -lncurses
}


package() {
	cd "$pkgname"
	install -Dm755 sheet "$pkgdir/usr/bin/sheet"
}
