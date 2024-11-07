 
 
# Maintainer: Radiolin <anton.osi2011@gmail.com>


pkgname=alpaca-ai
_pkgname=alpaca
pkgver=2.7.0
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
b2sums=(374e2aa2ae1f1b63dd2f10b24097c48a8e4b043892ff226f4473bf9f8b817a7fb46e4a539e04abdd514fa3ede22637f2855eb4599f3af46bf15076685b342e9f)

build() {
  arch-meson ${_pkgname^}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
