# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=vsco-scraper
pkgver=0.53
pkgrel=1
epoch=
pkgdesc="Allows for easy scraping of one VSCO at a time"
arch=("any")
url="https://github.com/mvabdi/vsco-scraper"
license=('MIT')
depends=('python' 'python-tqdm' 'python-requests' 'python-beautifulsoup4')
provides=('vsco-scraper')
source=("https://files.pythonhosted.org/packages/e8/a9/fb0d4334843a078565268da74dfb12529f45ab14aeadaf7e11076e246c28/$pkgname-$pkgver.tar.gz")
sha512sums=("66eceab85482eb3209dff0301dee9ad219433a4283f036d2a3e3f769fc603d7c6660e9a677a9655e99ed6450e78cbf2de23a0019cc3bed7bb7763871b205fc41")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

