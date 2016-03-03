# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=python2-xmp-toolkit
pkgver=r234.80ea772
pkgrel=1
pkgdesc='A library for working with XMP metadata'
arch=(any)
url='http://python-xmp-toolkit.readthedocs.org/'
license=(custom)
depends=('python2>=2.6'
         'exempi>=2.2.0')
source=('git+https://github.com/python-xmp-toolkit/python-xmp-toolkit.git')
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/python-xmp-toolkit"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/python-xmp-toolkit"
	/usr/bin/python2 setup.py build
}

package() {
	cd "$srcdir/python-xmp-toolkit"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	/usr/bin/python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
