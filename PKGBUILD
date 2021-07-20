# Maintainer: Repentinus <aur at repentinus dot eu>
# SPDX-License-Identifier: CC0-1.0

pkgname='python-numpy-docs'
pkgver=1.21
pkgrel=1
pkgdesc='Set of HTML documentation for python-numpy'
arch=('any')
url='https://numpy.org/doc/'
license=('BSD')
options=('docs' '!strip')
source=("$pkgname-$pkgver.zip::https://numpy.org/doc/$pkgver/numpy-html.zip")

# Calculated by the PKGBUILD maintainer as upstream does not provide any
sha256sums=('ae51558c862a58ae75a94e1cdec47ce491a2024d1ff7a0767002b69443d85ad3')

package() {
	mkdir -p "$pkgdir/usr/share/doc/python-numpy/html/"

	for f in *; do
		if [ "$f" != "$pkgname-$pkgver.zip" ]; then
			cp -r -t "$pkgdir/usr/share/doc/python-numpy/html/" "$f"
		fi
	done

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.html
}
