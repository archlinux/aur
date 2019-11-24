# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=vsco-scraper
pkgver=0.50
pkgrel=2
epoch=
pkgdesc="Allows for easy scraping of one VSCO at a time"
arch=("any")
url="https://github.com/mvabdi/vsco-scraper"
license=('MIT')
depends=('python' 'python-tqdm' 'python-requests' 'python-beautifulsoup4')
provides=('vsco-scraper')
source=("https://files.pythonhosted.org/packages/ac/a2/72bb375126a530064febed9892e5bb262d30c1e1d22d7d8c4fa1b6659c8b/$pkgname-$pkgver.tar.gz")
sha512sums=("60c6e416751619aead2c0d343ba9ea0f20465f1f114c03d3a7f31e24a0f2b5f77ad9ac8dd4f47dd5feef3328a2a0b03ecb66c213a31e76cec6ae17e925d91e19")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

