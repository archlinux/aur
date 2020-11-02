# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo
pkgver=0.3.0
pkgrel=0
pkgdesc="Lightweight, keyboard-oriented IDE for the masses"
arch=("x86_64")
conflicts=("tijolo-git")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("gc" "libevent" "pcre" "gtksourceview4" "nerd-fonts-jetbrains-mono" "libgit2" "vte3")
makedepends=("make" "git" "crystal>=0.35.1" "shards>=0.11.0")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/tijolo/archive/v${pkgver}.tar.gz")
sha256sums=('248be08cabf28e9f94dc5182eef82bf765c16a2b6696647c83cae314c93bf544')

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
  make install DESTDIR="${pkgdir}"
}
