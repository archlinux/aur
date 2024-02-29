# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=multiqc
pkgver=1.21
pkgrel=1
pkgdesc="Aggregate results from bioinformatics analyses across many samples into a single report"
arch=('any')
url="https://multiqc.info/"
license=('GPL3')
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
)
makedepends=(python-setuptools python-packaging)
source=($pkgname-$pkgver.tar.gz::https://github.com/MultiQC/MultiQC/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('c0e4887598628567b8fb1539445cf7b34a7ac6a8db2e52e10cc42cfa8e2202e2')

build() {
  cd "$srcdir/MultiQC-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/MultiQC-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
