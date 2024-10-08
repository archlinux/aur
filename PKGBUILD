 
 
# Maintainer: Radiolin <anton.osi2011@gmail.com>


pkgname=alpaca-ai
_pkgname=alpaca
pkgver=2.5.0
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
 pkgconf
 python3
 gtk-update-icon-cache
 desktop-file-utils
 gtksourceview5
)
makedepends=(
  git
  meson
)
options=(!debug)
source=($url/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=(9d84270d766a8fad6e060bc3d02e6cdfc208f6151e7b34135962489e5273a74a0c4440fc426e5fbe3dfd27dec2a799d4b9c317a65b928c2ec4deca2cbdee400f)

build() {
  arch-meson ${_pkgname^}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
