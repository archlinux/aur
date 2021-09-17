# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-akshare
pkgver=1.1.17
pkgrel=1
pkgdesc="Financial data interface library"
arch=('any')
url='https://www.akshare.xyz'
license=('MIT')
depends=(
	'python-beautifulsoup4>=4.9.1'
	'python-lxml>=4.2.1'
	'python-matplotlib>=3.1.1'
	'python-numpy>=1.17.2'
	'python-pandas>=0.25'
	'python-requests>=2.22.0'
	'python-urllib3>=1.25.8'
	'python-demjson'
	'python-pillow>=6.2.1'
	'python-pinyin>=0.35.0'
	'python-websocket-client>=0.56.0'
	'python-html5lib>=1.0.1'
	'python-tqdm>=4.43.0'
	'python-xlrd>=1.2.0'
	'python-openpyxl>=3.0.3'
	'python-jsonpath-ng>=0.82'
	'python-tabulate>=0.8.6'
	'python-decorator>=4.4.2'
	'python-pyminiracer>=0.6.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jindaxiang/akshare/archive/v$pkgver.tar.gz")
sha256sums=('ab55b3f470fb1d8f2d6bbb90aacbaeaed394bee1020d6efb6a7b463cd883a0c8')

build() {
	cd "akshare-$pkgver"
	python setup.py build
}

package() {
	cd "akshare-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
