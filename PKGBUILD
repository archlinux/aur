# Maintainer: amadejpapez

pkgname=python-stegoveritas
_pkgname=stegoVeritas
pkgver=1.9
pkgrel=1
pkgdesc='General Steganography detection tool.'
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
sha256sums=('824ba80127ec296b3010e5cbd7091329e1650cbca7e4a890b17dc8510c3bddf8')

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
