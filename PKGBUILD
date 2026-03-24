# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Sid127 <sidpranjale127@protonmail.com>
# Contributor: Pedro dev <pedrolucasinvestidor.github@gmail.com>
# Contributor: Radiolin <anton.osi2011@gmail.com>

pkgname=alpaca-ai
pkgver=9.2.2
pkgrel=1
pkgdesc='An Ollama client. Chat with local AI models or connect to third party AI providers like ChatGPT, Gemini and more'
arch=('any')
url='https://github.com/Jeffser/Alpaca'
license=('GPL-3.0-or-later')
# TODO: review dependencies
makedepends=(
  'appstream'
  'desktop-file-utils'
  'gettext'
  'git'
  'meson'
)
depends=(
  'dconf'
  'gdk-pixbuf2'
  'glib2'
  'gtk4'
  'gtksourceview5'
  'hicolor-icon-theme'
  'libadwaita'
  'libspelling'
  'pango'
  'python'
  'python-gobject'
  'python-html2text'
  'python-matplotlib'
  'python-odfpy'
  'python-openai'              # AUR dependency
  'python-pillow'
  'python-pydantic'
  'python-pydbus'
  'python-pyicu'
  'python-pypdf'
  'python-requests'
  'python-youtube-transcript-api' # AUR dependency
  'python-pyaudio'
  'python-openai-whisper'
  'vte4'
  'libvoikko'
  'nuspell'
  'hspell'
  'ollama'
  'python-markitdown'          # AUR dependency (found during runtime error)
  'python-mammoth'             # AUR dependency (dependency of python-markitdown)
  'python-markdownify'         # AUR dependency (dependency of python-markitdown)
  'python-pptx'                # AUR dependency (dependency of python-markitdown)
  'python-pydub'               # AUR dependency (dependency of python-markitdown)
  'python-speechrecognition'   # AUR dependency (dependency of python-markitdown)
  'python-pathvalidate'        # AUR dependency (dependency of python-markitdown)
  'python-cobble'              # AUR dependency (dependency of python-markitdown)
  'python-magika'              # AUR dependency (dependency of python-markitdown)
  'libportal'
  'python-opencv'
  'python-duckduckgo-search'
  'python-cairo'
  'gst-plugin-pipewire'
  'webkitgtk-6.0'
  'blueprint-compiler'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('13b73699c6223cb0a9231fa82a06d30c4ee7f02784b3614cef43c9b86191ac0780a97383dee9a46f9d8473fc326fb6994383f28701a0854e6b7b946c0f1f9ae5')

build() {
  arch-meson "Alpaca-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
