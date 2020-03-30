# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-line
pkgver=3.1.1
pkgrel=1
pkgdesc='OpenType vertical metrics reporting and font line spacing adjustment tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-commandlines' 'python-fonttools' 'python-standardstreams')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('79f8dbcf1250c66ea1dde83d44c6fc74e90a0746dd92b41fdee594db6fb36957')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
