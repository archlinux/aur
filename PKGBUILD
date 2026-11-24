# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lue
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal eBook reader with text-to-speech for EPUB, PDF, DOCX, HTML, RTF and Markdown"
arch=('any')
url="https://github.com/paulilaaso/lue"
license=('GPL-3.0-only')
depends=('python' 'python-docx' 'python-edge-tts' 'python-markdown' 'python-numpy' 'python-platformdirs' 'python-pymupdf' 'python-rich' 'python-striprtf')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/l/lue_reader/lue_reader-${pkgver}.tar.gz")
sha256sums=('8e1ce6a5719e5e1cb69a231cb4074ffc842f533a2389fe78e2d419cd22b9f6a1')

build() {
  cd "lue_reader-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "lue_reader-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
