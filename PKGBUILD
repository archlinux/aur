# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=multiqc
pkgver=1.19
pkgrel=1
pkgdesc="Aggregate results from bioinformatics analyses across many samples into a single report"
arch=('any')
url="https://multiqc.info/"
license=('GPL3')
depends=(
	python-matplotlib
	python-networkx
	python-numpy
	python-click
	python-coloredlogs
	python-future
	python-jinja
	python-lzstring
	python-markdown
	python-packaging
	python-yaml
	python-requests
	python-rich
	python-rich-click
	python-simplejson
	python-spectra
	python-importlib-metadata
	python-humanize
	python-pyaml-env
)
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/MultiQC/MultiQC/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('7c1501c8306f69a6f32777fe732fb4a53f71b066512a2252a8b2b4b89f994ca8')

build() {
  cd "$srcdir/MultiQC-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/MultiQC-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
