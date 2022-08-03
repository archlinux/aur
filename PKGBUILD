# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=vsco-scraper
pkgver=0.70
pkgrel=1
epoch=
pkgdesc="Allows for easy scraping of one VSCO at a time"
arch=("any")
url="https://github.com/mvabdi/vsco-scraper"
license=('MIT')
depends=('python' 'python-tqdm' 'python-requests' 'python-beautifulsoup4')
provides=('vsco-scraper')
source=("https://files.pythonhosted.org/packages/16/e1/d7b731fd771054e87e90845d4ea9612f3f3d3755d4f46fd78cb78eb45c25/${pkgname}-${pkgver}.tar.gz")
sha512sums=("8e5256252335bd7fd4c6875ba1f627cbce6564590a9c808ca4a8ce0a4ce167353bff01b3bbf0e7bb11102efad67ebefe1029f7085b8912750aa0398588fe76bc")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

