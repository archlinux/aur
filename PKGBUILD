# Maintainer: André Koch-Kramer <koch-kramer@web.de>

pkgname=instaloader
pkgver=4.5.4
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
sha512sums=('2b1deee245638ae4713d714f34f67c5de97ba1a2e6150c81c3b49ca16e431871d7241b38562ed65dd84d90b3047b370aba37738466ec1c9274731ee4d313d3eb')

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
