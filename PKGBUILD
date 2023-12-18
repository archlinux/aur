# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo
pkgver=0.8.0alpha
pkgrel=2
pkgdesc="Lightweight, keyboard-oriented IDE for the masses"
arch=("x86_64")
conflicts=("tijolo-git")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("gc" "libevent" "pcre" "gtk4>=1:4.12.4" "libadwaita>=1:1.4.2" "gtksourceview5" "ttf-jetbrains-mono-nerd" "vte4")
makedepends=("make" "git" "crystal>=1.6.2" "shards>=0.14.0" "libyaml")
optdepends=('ccls: C/C++ LSP support'
            'bash-language-server: Bash LSP support'
            'yaml-language-server: YAML LSP support'
            'python-lsp-server: Python LSP support')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/tijolo/archive/v${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/tijolo/archive/v0.8.0-alpha.tar.gz")
sha256sums=('41858a0fe003829640e4ec324e7e0d46ac9f232ef222efd5075375dfa858d2c0')

build() {
  # cd "$srcdir/tijolo-$pkgver"
  cd "$srcdir/tijolo-0.8.0-alpha"
  make
}

package() {
  # cd "$srcdir/tijolo-$pkgver"
  cd "$srcdir/tijolo-0.8.0-alpha"
  make install DESTDIR="${pkgdir}"
  rm -rf ${pkgdir}/usrshare
  install -D -m644 data/gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/io.github.hugopl.Tijolo.gschema.xml
}
