# Maintainer: André Koch-Kramer <koch-kramer@web.de>

pkgname=instaloader
pkgver=4.1.1
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
sha512sums=('c09a2b0c8e2f7a0b15e23a6091453e8c7e797e5e497f80c5718cbf4861c203ec68fe0db62e9708f778fbba865338ec756f908c508c88a51316df96689f92b7f5')

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
