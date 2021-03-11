
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=python-stegoveritas
_pkgname=stegoVeritas
pkgver=1.8
pkgrel=1
pkgdesc='Yet another Stego Tool.'
arch=('any')
url="https://github.com/bannsec/$_pkgname"
license=('GPL2')
depends=(
	'python' 'python-pillow' 'python-numpy' 'python-magic'
	'python-prettytable' 'python-exifread' 'python-xmp-toolkit' 'binwalk'
	'python-pypng' 'python-apng' 'python-pfp' 'python-distro'
)
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver::$url/archive/$pkgver.tar.gz")
sha256sums=('d002cb29b3e98e2860bbeff47dd93ebc04b21288dcd4a2473fd18f2900171033')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE.md' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
}
