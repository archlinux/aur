 
 
# Maintainer: Radiolin <anton.osi2011@gmail.com>


pkgname=alpaca-ai
_pkgname=alpaca
pkgver=2.6.0
pkgrel=2
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
b2sums=(ff34f0a6d3f9da879a60ca88043c52755ee0a890749ac8dddb08cd7144a5df6283bc8e84b485beb8449e22e4e4f5c7c95efdea6560a2f0515d864e2b47b20815)

build() {
  arch-meson ${_pkgname^}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
