# Maintainer: ItsZariep <itszariep@disroot.org>
pkgname=sgnotes-git
pkgver=r37.cde3176
pkgrel=1
pkgdesc="A simple GTK3 note-taking application"
arch=('any')
url="https://codeberg.org/ItsZariep/SGNotes"
license=('GPL')
depends=('gtk3' 'gtksourceview4')
makedepends=('git' 'gtk3' 'gtksourceview4')
source=("git+$url.git#branch=stable")
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/SGNotes"
echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
cd "$srcdir/SGNotes/src"
make WITHSOURCEVIEW=1
}

package() {
cd "$srcdir/SGNotes/src"
make PREFIX="$pkgdir/usr" install
}

clean() {
cd "$srcdir/SGNotes/src"
make clean
}
