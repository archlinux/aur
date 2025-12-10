# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=llm-thalamus
_pkgname=llm_thalamus
pkgver=0.3
pkgrel=1
pkgdesc="Local AI controller and PySide6 UI integrating OpenMemory with Ollama"
arch=('any')
url="https://github.com/evertvorster/llm_thalamus"
license=('GPL-3.0-or-later')
depends=(
  'ollama'
  'python'
  'pyside6'               # Qt6 Python bindings (includes WebEngine bindings) :contentReference[oaicite:0]{index=0}
  'python-markdown-it-py' # markdown-it-py parser
  'python-requests'
  'python-openmemory'  # your OpenMemory wrapper package (AUR)
  'katex'                 # provides /usr/lib/node_modules/katex/dist assets :contentReference[oaicite:1]{index=1}
  'qt6-webengine'         # underlying Qt WebEngine libs :contentReference[oaicite:2]{index=2}
)
makedepends=('python')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/evertvorster/llm_thalamus/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('SKIP')  # Run updpkgsums once you tag v0.1

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Pure Python, nothing to build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Use the project Makefile to install everything
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  # Install license if/when you add one
  # mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  # install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
