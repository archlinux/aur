# Maintainer: Repentinus <aur at repentinus dot eu>
# SPDX-License-Identifier: CC0-1.0

pkgname='python-numpy-docs'
pkgver=1.26
pkgrel=1
pkgdesc='Set of HTML documentation for python-numpy'
arch=('any')
url='https://numpy.org/doc/'
license=('BSD')
options=('docs' '!strip')
source=("$pkgname-$pkgver.zip::https://numpy.org/doc/$pkgver/numpy-html.zip")

# Calculated by the PKGBUILD maintainer as upstream does not provide any
sha256sums=('1dc88fc45a7709143b7b917e8e807e4985c41fe3fb7ee5fc55c3aeec5f369fdd')

package() {
	mkdir -p "$pkgdir/usr/share/doc/python-numpy/html/"

	for f in *; do
		if [ "$f" != "$pkgname-$pkgver.zip" ]; then
			cp -r -t "$pkgdir/usr/share/doc/python-numpy/html/" "$f"
		fi
	done

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.html
}
