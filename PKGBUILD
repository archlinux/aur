# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=alpaca-ai
_pkgname=alpaca
pkgver=5.3.0
pkgrel=1
pkgdesc="An Ollama client. Chat with local AI models or connect to third party AI providers like ChatGPT , Gemini and more"
arch=(any)
url="https://github.com/Jeffser/${_pkgname%-git}"
license=(GPL-3.0-or-later)
options=(!debug)
source=($url/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
b2sums=('SKIP')
depends=(
    dconf
    gdk-pixbuf2
    glib2
    gtk4
    gtksourceview5
    hicolor-icon-theme
    libadwaita
    libspelling
    pango
    python
    python-gobject
    python-html2text
    python-matplotlib
    python-odfpy
    python-openai
    python-pillow
    python-pydantic
    python-pydbus
    python-pyicu
    python-pypdf
    python-requests
    python-youtube-transcript-api
    vte4
    libvoikko
    nuspell
    hspell
)
makedepends=(
    appstream
    desktop-file-utils
    gettext
    git
    meson
)
optdepends=(
    'ollama: local ollama instance'
)

build() {
    arch-meson ${_pkgname^}-$pkgver build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
