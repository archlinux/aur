# Maintainer: Kim Scarborough <kim@scarborough.kim>
# Contributor: rern <rernrern@gmail.com>

pkgname=python-smbus2
pkgver=0.6.1
pkgrel=1
pkgdesc='A drop-in replacement for smbus-cffi/smbus-python'
url="https://github.com/kplindegaard/smbus2"
license=(MIT)
arch=(any)
depends=(python)
makedepends=(python-setuptools)
source=("https://github.com/kplindegaard/smbus2/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('05bf3f16390f5ddecfd6f391e3d6c84c92fbc60a328f3395437311cc9eecf8d5')

package() {
	cd "$srcdir/smbus2-$pkgver"
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
