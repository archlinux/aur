# Maintainer: Repentinus <aur at repentinus dot eu>
# SPDX-License-Identifier: CC0-1.0

pkgname='python-numpy-docs'
pkgver=1.23
pkgrel=1
pkgdesc='Set of HTML documentation for python-numpy'
arch=('any')
url='https://numpy.org/doc/'
license=('BSD')
options=('docs' '!strip')
source=("$pkgname-$pkgver.zip::https://numpy.org/doc/$pkgver/numpy-html.zip")

# Calculated by the PKGBUILD maintainer as upstream does not provide any
sha256sums=('14a82b5a8561f7027872141278009b99a92d11af6bc8908b7ae9a10b8cb721bd')

package() {
	mkdir -p "$pkgdir/usr/share/doc/python-numpy/html/"

	for f in *; do
		if [ "$f" != "$pkgname-$pkgver.zip" ]; then
			cp -r -t "$pkgdir/usr/share/doc/python-numpy/html/" "$f"
		fi
	done

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.html
}
