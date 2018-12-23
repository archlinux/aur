# Maintainer: André Koch-Kramer <koch-kramer@web.de>

pkgname=instaloader
pkgver=4.2
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
sha512sums=('e27987feda9f7cdcf470e6f71910705d089f2c79772bbad006abb1c7c367612302f3ea2ab4e037d9b02ff3dbda2fe06e27bd3ca0bf7d321f3ee701784fbb282a')

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
