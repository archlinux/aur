# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=multiqc
pkgver=1.35
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
    python-natsort
    python-numpy
    python-requests
    python-pillow
    python-plotly
    python-yaml
    python-rich
    python-rich-click
    python-spectra
    python-tiktoken
    python-tqdm
    python-pydantic
    python-typeguard
    python-polars
    python-pyarrow
)
optdepends=(
    'chromium: Static plot export with Kaleido 1.x'
    'ipython: Display reports and plots in notebooks'
)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=($pkgname-$pkgver.tar.gz::https://github.com/MultiQC/MultiQC/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('b76fa0562b5720fe338f19dc03a3043f6f1fad310315470dccc7b41ccf54cd1a')

build() {
  cd MultiQC-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd MultiQC-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
