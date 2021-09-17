# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pinyin
pkgver=0.42.0
pkgrel=1
pkgdesc="Chinese to Pinyin Python library"
arch=('any')
url='https://pypinyin.readthedocs.io'
license=('MIT')
depends=('python>=3.6')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozillazg/python-pinyin/archive/v$pkgver.tar.gz")
sha256sums=('56b665413b716ac05d362a99c2917212f8beb126cce381afa393eb39304d00ff')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
