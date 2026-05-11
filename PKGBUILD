# Maintainer: Will Handley <williamjameshandley@gmail.com>

pkgname=python-resemble-perth
_pkgname=resemble_perth
pkgver=1.0.1
pkgrel=1
pkgdesc='Audio watermarking and detection library by Resemble AI (PerTh)'
arch=('any')
url='https://github.com/resemble-ai/Perth'
license=('MIT')
depends=(
  'python'
  'python-pytorch-opt-cuda'
  'python-torchaudio'
  'python-numpy'
  'python-scipy'
  'python-librosa'
  'python-soundfile'
  'python-audioread'
  'python-matplotlib'
  'python-pydub'
  'python-pyrubberband'
  'python-yaml'
  'python-setuptools'  # runtime: pkg_resources used in code
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/d8/02/f9b5adba306b5cd8bc5525f6bcad8f9d6840c6635d74fcf229a45c0dfb56/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e4688cfc22e07b2ace567b987eb2c26e4ac19cbc37fbfacfd6794a2933ad2392')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
