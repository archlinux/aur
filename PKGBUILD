# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo
pkgver=0.4.0
pkgrel=0
pkgdesc="Lightweight, keyboard-oriented IDE for the masses"
arch=("x86_64")
conflicts=("tijolo-git")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("gc" "libevent" "pcre" "gtksourceview4" "nerd-fonts-jetbrains-mono" "libgit2" "vte3" "editorconfig-core-c")
makedepends=("make" "git" "crystal>=0.35.1" "shards>=0.11.0")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/tijolo/archive/v${pkgver}.tar.gz")
sha256sums=('7e189c7e9e63c02bb7dfd4ce1207d30e0f0527ec6ea673ea91714fec98004003')

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
