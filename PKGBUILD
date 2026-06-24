# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
# Contributor: amadejpapez
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=python-stegoveritas
_pkgname=stegoVeritas
pkgver=1.11
pkgrel=1
pkgdesc='General Steganography detection tool.'
arch=('any')
url="https://github.com/bannsec/$_pkgname"
license=('GPL-2.0-only')
depends=(
	'python' 'python-pillow' 'python-numpy' 'python-magic'
	'python-prettytable' 'python-exifread' 'python-xmp-toolkit' 'binwalk'
	'python-pypng' 'python-apng' 'python-pfp' 'python-distro'
)
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('411d8417cb8486a52bc0aa35c6b5aab63de79202bec9ba5819ac23d0d94aac9d')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
}
