# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-line
pkgver=3.1.2
pkgrel=1
pkgdesc='OpenType vertical metrics reporting and font line spacing adjustment tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-commandlines' 'python-fonttools' 'python-standardstreams')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('708b5f815d7f6dee478c723950c383ed31abc22343bd176da24bbc4762f7f8b1')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
