# Maintainer: André Koch-Kramer <koch-kramer@web.de>

pkgname=instaloader
pkgver=4.4.1
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
sha512sums=('aeb2db4fb65a74b6c6e010142658a48b4b99a2ca1ff138c265c62366e38d0d789b938725d241b7314df2fb445011447b28d8881589ef782ca50a6e4e443a26ea')

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
