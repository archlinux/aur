# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=arxiv-collector
pkgver=0.3.5
pkgrel=1
pkgdesc="Small script to collect LaTeX sources for upload to the arXiv"
arch=(any)
url="https://github.com/dougalsutherland/arxiv-collector"
license=('BSD')
depends=(texlive-core)
makedepends=(python-setuptools)
source=("https://github.com/djsutherland/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e574e4db8f53f138397c0e815eb1203a02fc5503c9246b9821ff3fe14dbfea5d')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	# License
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
