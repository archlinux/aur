# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: patina
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Sid127 <sidpranjale127@protonmail.com>
# Contributor: Pedro dev <pedrolucasinvestidor.github@gmail.com>
# Contributor: Radiolin <anton.osi2011@gmail.com>

pkgname=alpaca-ai
pkgdesc='Chat with local AI models or connect to third party AI providers'
pkgver=9.2.5
pkgrel=1
url='https://github.com/Jeffser/Alpaca'
arch=(any)
license=('GPL-3.0-or-later')
makedepends=(
  'appstream'
  'blueprint-compiler'
  'desktop-file-utils'
  'gettext'
  'git'
  'meson'
)
depends=(
  'dconf'
  'glib2'
  'gst-plugin-pipewire'
  'gtk4'
  'gtksourceview5'
  'hicolor-icon-theme'
  'libadwaita'
  'libportal'
  'libspelling'
  'pango'
  'python'
  'python-cairo'
  'python-gobject'
  'python-html2text'
  'python-markitdown'
  'python-matplotlib'
  'python-odfpy'
  'python-ollama'
  'python-opencv'
  'python-pillow'
  'python-pyicu'
  'python-pydbus'
  'python-requests'
  'python-zstandard'
  'vte4'
  'webkitgtk-6.0'
)
optdepends=(
  'python-kokoro: Text-to-Speech backend for Live Chat and Podcast modes'
  'python-misaki-en: default engine for Kokoro models'
  'python-sounddevice: Text-to-Speech output for Live Chat mode'
  'python-openai-whisper: Speech-to-Text backend for Transcriber mode'
  'python-pyaudio: microphone input for Transcriber mode'
  'python-rembg: Background Remover tool'
  'python-openai: connect to OpenAI-compatible APIs'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('036309d37c7a4804c3b492e7abc08c51dd8ae15cf310b69ee519a91581f155ff53f15e0db8369dd7e5713ca6a696f7cbe07d02d8b196fcb37e338401c543a0a4')

build() {
  arch-meson "Alpaca-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
