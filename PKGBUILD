# Maintainer: Repentinus <aur at repentinus dot eu>
# SPDX-License-Identifier: CC0-1.0

pkgname='python-numpy-docs'
pkgver=1.24
pkgrel=1
pkgdesc='Set of HTML documentation for python-numpy'
arch=('any')
url='https://numpy.org/doc/'
license=('BSD')
options=('docs' '!strip')
source=("$pkgname-$pkgver.zip::https://numpy.org/doc/$pkgver/numpy-html.zip")

# Calculated by the PKGBUILD maintainer as upstream does not provide any
sha256sums=('48c5f0b260848255f6bf5e9630488515e8dc55c4c330f31c2ffcb73e999dae64')

package() {
	mkdir -p "$pkgdir/usr/share/doc/python-numpy/html/"

	for f in *; do
		if [ "$f" != "$pkgname-$pkgver.zip" ]; then
			cp -r -t "$pkgdir/usr/share/doc/python-numpy/html/" "$f"
		fi
	done

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.html
}
