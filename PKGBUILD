# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: patina
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Sid127 <sidpranjale127@protonmail.com>
# Contributor: Pedro dev <pedrolucasinvestidor.github@gmail.com>
# Contributor: Radiolin <anton.osi2011@gmail.com>

pkgname=alpaca-ai
pkgver=9.2.3
pkgrel=1
pkgdesc='An Ollama client. Chat with local AI models or connect to third party AI providers like ChatGPT, Gemini and more'
arch=('any')
url='https://github.com/Jeffser/Alpaca'
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
b2sums=('4aa5357bf621d04d93d60dd8c0eed4293f476358a5fcf9e54a6212642bf4d7eadbf38fa57a0df6fc930d8dc5854634539320cef523e478460bc1bae0257c5af7')

build() {
  arch-meson "${srcdir}/Alpaca-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
