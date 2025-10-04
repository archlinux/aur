# Maintainer: Your Name <youremail@example.com>
pkgname=animepahe-dl
pkgver=5.3.0
pkgrel=1
pkgdesc="A Python-based tool to download anime from AnimePahe, featuring both a Command-Line Interface (CLI) and a Graphical User Interface (GUI)."
arch=('any')
url="https://github.com/ayushjaipuriyar/animepahe-dl"
license=('MIT')
depends=(
  'python'
  'ffmpeg'
  'fzf'
  'nodejs'
  'python-beautifulsoup4'
  'python-pyfzf'
  'python-pycryptodome'
  'python-tqdm'
  'python-urllib3'
  'python-pyqt6'
  'python-platformdirs'
  'python-loguru'
  'python-plyer'
  'python-questionary'
)
makedepends=('python-setuptools' 'python-build')
source=("git+https://github.com/ayushjaipuriyar/animepahe-dl.git#tag=v5.3.0")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m pip install --root="${pkgdir}" --no-deps --ignore-installed .
}
