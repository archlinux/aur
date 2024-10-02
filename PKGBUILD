# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=multiqc
pkgver=1.25.1
pkgrel=1
pkgdesc="Aggregate results from bioinformatics analyses across many samples into a single report"
arch=('any')
url="https://multiqc.info/"
license=('GPL-3.0-or-later')
depends=(
    python-click
    python-coloredlogs
    python-humanize
    python-importlib-metadata
    python-jinja
    python-kaleido-bin
    python-markdown
    python-matplotlib
    python-numpy
    python-requests
    python-pillow
    python-plotly
    python-yaml
    python-pyaml-env
    python-rich
    python-rich-click
    python-spectra
    python-tqdm
    python-pydantic
    python-typeguard
)
makedepends=(python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::https://github.com/MultiQC/MultiQC/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('829a08f44e0183224ef1d8c0ecb163c6acc54f1a1d85445ed62857f5603ee7cb')

build() {
  cd MultiQC-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd MultiQC-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
