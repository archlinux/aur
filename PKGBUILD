 
 
# Maintainer: Radiolin <anton.osi2011@gmail.com>


pkgname=alpaca-ai
_pkgname=alpaca
pkgver=2.6.5
pkgrel=1
pkgdesc="Alpaca is an Ollama client where you can manage and chat with multiple models, Alpaca provides an easy and begginer friendly way of interacting with local AI, everything is open source and powered by Ollama."
arch=(x86_64)
url="https://github.com/Jeffser/${_pkgname%-git}"
license=(GPL-3.0-only)
depends=(
 ollama
 python-pypdf
 python-pytube
 python-html2text
 gettext
 desktop-file-utils
 appstream
 glib2
 vte4
 pkgconf
 python3
 gtk-update-icon-cache
 desktop-file-utils
 gtksourceview5
 python-grequests
)
makedepends=(
  git
  meson
)
options=(!debug)
source=($url/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=(4ece5ab2579d94f82541b38fe687183ddc84e7580f8967d434477a49cd244bf40d54fbaedb508161cbd1b02df59717e13f443e3e4a35e01a734eaf6c6995d844)

build() {
  arch-meson ${_pkgname^}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
