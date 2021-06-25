# Maintainer: Repentinus <aur at repentinus dot eu>
# SPDX-License-Identifier: CC0-1.0

pkgname='python-numpy-docs'
pkgver=1.20
pkgrel=1
pkgdesc='Set of HTML documentation for python-numpy'
arch=('any')
url='https://numpy.org/doc/'
license=('BSD')
options=('docs' '!strip')
source=("$pkgname-$pkgver.zip::https://numpy.org/doc/$pkgver/numpy-html.zip")

# Calculated by the PKGBUILD maintainer as upstream does not provide any
sha256sums=('1aef600edb79e0632180aa89271293781b086a0116a024d854858776ea67f6d3')

package() {
	mkdir -p "$pkgdir/usr/share/doc/python-numpy/html/"

	for f in *; do
		if [ "$f" != "$pkgname-$pkgver.zip" ]; then
			cp -r -t "$pkgdir/usr/share/doc/python-numpy/html/" "$f"
		fi
	done

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.html
}
