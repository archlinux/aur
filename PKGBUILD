# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo
pkgver=0.7.3
pkgrel=1
pkgdesc="Lightweight, keyboard-oriented IDE for the masses"
arch=("x86_64")
conflicts=("tijolo-git")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("gc" "libevent" "pcre" "gtksourceview4" "ttf-jetbrains-mono-nerd" "libgit2" "editorconfig-core-c" "ttf-font-awesome>=6.2.1" "vte3")
makedepends=("make" "git" "crystal>=1.6.2" "shards>=0.14.0" "libyaml")
optdepends=('ccls: C/C++ LSP support'
            'bash-language-server: Bash LSP support'
            'yaml-language-server: YAML LSP support'
            'python-language-server: Python LSP support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/tijolo/archive/v${pkgver}.tar.gz")
sha256sums=('fc003b9b25bc744059c241613d5c9f6330fe10eb46cfb2608cddd58679cbbffc')

build() {
  cd "$srcdir/tijolo-$pkgver"
  make
}

package() {
  cd "$srcdir/tijolo-$pkgver"
  make install DESTDIR="${pkgdir}"
}
