# Maintainer: Nick77 <qwiko20@tutamail.com>

pkgname=jakana-cli
pkgver=0.1.0
pkgrel=1
pkgdesc='learn Japanese kana on cli'
arch=('any')
url='https://github.com/Catalina-sys456/jakana-cli'
license=('MIT')
depends=('python')
makedepends=(python-build
	     python-installer
	     python-wheel
	     python-hatchling)
source=(        
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('31c987fcff0965cfa89e12e6d4f09aef4f7f6bb42d789f5092bf26d436a8eea8df4103f82dbdb195f3da56d7a2385dbe142994cf6be0ad1b31adeb1caba34271')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}


