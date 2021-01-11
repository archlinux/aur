# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo
pkgver=0.4.1
pkgrel=0
pkgdesc="Lightweight, keyboard-oriented IDE for the masses"
arch=("x86_64")
conflicts=("tijolo-git")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("gc" "libevent" "pcre" "gtksourceview4" "nerd-fonts-jetbrains-mono" "libgit2" "vte3" "editorconfig-core-c")
makedepends=("make" "git" "crystal>=0.35.1" "shards>=0.11.0")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/tijolo/archive/v${pkgver}.tar.gz")
sha256sums=('38c7b520fbc12eeb132fd415f9fdeb3ca545349cba6bdbd261b352ac7e544598')

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
