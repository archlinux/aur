# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=multiqc
pkgver=1.31
pkgrel=1
pkgdesc="Aggregate results from bioinformatics analyses across many samples into a single report"
arch=('any')
url="https://multiqc.info/"
license=('GPL-3.0-or-later')
depends=(
    python-boto3
    python-click
    python-coloredlogs
    python-dotenv
    python-humanize
    python-importlib-metadata
    python-jinja
    python-jsonschema
    python-kaleido-bin
    python-markdown
    python-matplotlib
    python-natsort
    python-numpy
    python-requests
    python-pillow
    python-plotly
    python-yaml
    python-pyaml-env
    python-rich
    python-rich-click
    python-spectra
    python-tiktoken
    python-tqdm
    python-pydantic
    python-typeguard
)
makedepends=(python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::https://github.com/MultiQC/MultiQC/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('0d9aef6a956dc34eeb1667e128f79a2969f0c57c3958403991c9ee5f22d70096')

build() {
  cd MultiQC-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd MultiQC-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
