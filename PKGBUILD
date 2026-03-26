# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: patina
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Sid127 <sidpranjale127@protonmail.com>
# Contributor: Pedro dev <pedrolucasinvestidor.github@gmail.com>
# Contributor: Radiolin <anton.osi2011@gmail.com>

pkgname=alpaca-ai
pkgver=9.2.2
pkgrel=2
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
b2sums=('13b73699c6223cb0a9231fa82a06d30c4ee7f02784b3614cef43c9b86191ac0780a97383dee9a46f9d8473fc326fb6994383f28701a0854e6b7b946c0f1f9ae5')

build() {
  arch-meson "${srcdir}/Alpaca-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
