# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo
pkgver=0.4.1
pkgrel=3
pkgdesc="Lightweight, keyboard-oriented IDE for the masses"
arch=("x86_64")
conflicts=("tijolo-git")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("gc" "libevent" "pcre" "gtksourceview4" "nerd-fonts-jetbrains-mono" "libgit2" "vte3" "editorconfig-core-c")
makedepends=("make" "git" "crystal<0.36.0" "shards>=0.11.0" "libyaml")
optdepends=('ccls: C/C++ LSP support'
            'bash-language-server: Bash LSP support'
            'yaml-language-server: YAML LSP support'
            'python-language-server: Python LSP support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/tijolo/archive/v${pkgver}.tar.gz")
sha256sums=('38c7b520fbc12eeb132fd415f9fdeb3ca545349cba6bdbd261b352ac7e544598')

build() {
  cd "$srcdir/tijolo-$pkgver"
  make
}

package() {
  cd "$srcdir/tijolo-$pkgver"
  make install DESTDIR="${pkgdir}"
}
