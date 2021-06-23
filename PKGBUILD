# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo
pkgver=0.7.0
pkgrel=1
pkgdesc="Lightweight, keyboard-oriented IDE for the masses"
arch=("x86_64")
conflicts=("tijolo-git")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("gc" "libevent" "pcre" "gtksourceview4" "nerd-fonts-jetbrains-mono" "libgit2" "editorconfig-core-c" "ttf-font-awesome>=5.15" "vte3")
makedepends=("make" "git" "crystal>=1.0.0" "shards>=0.14.0" "libyaml")
optdepends=('ccls: C/C++ LSP support'
            'bash-language-server: Bash LSP support'
            'yaml-language-server-bin: YAML LSP support'
            'python-language-server: Python LSP support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/tijolo/archive/v${pkgver}.tar.gz")
sha256sums=('3775a005b8e04ec345c77ba1cfd8320261482c5c2964ef058a614c835c8508f7')

build() {
  cd "$srcdir/tijolo-$pkgver"
  make
}

package() {
  cd "$srcdir/tijolo-$pkgver"
  make install DESTDIR="${pkgdir}"
}
