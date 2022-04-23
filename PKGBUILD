# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=vsco-scraper
pkgver=0.65
pkgrel=1
epoch=
pkgdesc="Allows for easy scraping of one VSCO at a time"
arch=("any")
url="https://github.com/mvabdi/vsco-scraper"
license=('MIT')
depends=('python' 'python-tqdm' 'python-requests' 'python-beautifulsoup4')
provides=('vsco-scraper')
source=("https://files.pythonhosted.org/packages/b6/c2/bd35626f5ac4f7b479dfd897c020780827e21879a1bcd4dc29a9c8b92700/${pkgname}-${pkgver}.tar.gz")
sha256sums=("566bf344a9ba9084982461812a4b642a0dc15818270b3b847bd6bc3782d7758a")

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

