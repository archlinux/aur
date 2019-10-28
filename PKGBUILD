# Maintainer: André Koch-Kramer <koch-kramer@web.de>

pkgname=instaloader
pkgver=4.2.10
pkgrel=1
pkgdesc="Command line tool to download pictures, videos and metadata from Instagram"
arch=('any')
url="https://instaloader.github.io/"
license=('MIT')
groups=()
depends=('python>=3.5' 'python-requests>=2.4')
makedepends=('python-setuptools')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/instaloader/instaloader/tar.gz/v$pkgver)
sha512sums=('8e115a66d4dae4c823bc043af78a175507e203f4336e7e161fff4f43178402a7060c1861687fbc56401089fece0a238eacdb71683ffd6c5b3265864d58edcfe5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	python setup.py install --root "$pkgdir/" --skip-build
}
