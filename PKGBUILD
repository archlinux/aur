# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pinyin
pkgver=0.44.0
pkgrel=1
pkgdesc="Chinese to Pinyin Python library"
arch=('any')
url='https://pypinyin.readthedocs.io'
license=('MIT')
depends=('python>=3.6')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozillazg/python-pinyin/archive/v$pkgver.tar.gz")
sha256sums=('94729397969f093114f6a82c8294c2bc8c575595b74ea21a4c0219a93de06248')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
