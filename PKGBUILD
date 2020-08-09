# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight, keyboard-oriented IDE for the masses"
arch=("x86_64")
conflicts=("tijolo-git")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("gc" "libevent" "pcre" "gtksourceview4" "nerd-fonts-jetbrains-mono" "libgit2")
makedepends=("git" "crystal>=0.35.1" "shards>=0.11.0")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/tijolo/archive/v${pkgver}.tar.gz")
sha256sums=('c5f978c4fcce99bc97af58fb634f6699102b2eddd2d3816adaaeb315c863c9c8')

build() {
  cd "$srcdir/tijolo-$pkgver"
  make
}

check() {
  # Can't check anything, since tests needs tijolo own project repo to execute.
  true
}

package() {
  cd "$srcdir/tijolo-$pkgver"
  make install DESTDIR="${pkgdir}/usr"
}
