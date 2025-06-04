# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=multiqc
pkgver=1.29
pkgrel=1
pkgdesc="Aggregate results from bioinformatics analyses across many samples into a single report"
arch=('any')
url="https://multiqc.info/"
license=('GPL-3.0-or-later')
depends=(
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
sha256sums=('3c81adf083fa899e4d4538021577b17d8f5f88fdf0b364a0192722ff85547936')

build() {
  cd MultiQC-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd MultiQC-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
