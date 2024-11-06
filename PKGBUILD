# Maintainer: thek4n

pkgname='note-manager'
pkgver=1.23.0
pkgrel=1
pkgdesc="Simple CLI notes manager"
arch=('any')
url='https://github.com/thek4n/note'
license=('MIT')
depends=(
  'git'
)
optdepends=(
  'fzf: find notes'
  'bat: render notes in terminal'
  'tree: tree of notes'
  'ripgrep: find notes by content'
)
conflicts=('note-manager')
source=("$pkgname::git+https://github.com/thek4n/note.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    cd "$srcdir"/"$pkgname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}