# Maintainer: Kim Scarborough <kim@scarborough.kim>
# Contributor: rern <rernrern@gmail.com>

pkgname=python-smbus2
pkgver=0.6.0
pkgrel=1
pkgdesc='A drop-in replacement for smbus-cffi/smbus-python'
url="https://github.com/kplindegaard/smbus2"
license=(MIT)
arch=(any)
depends=(python)
makedepends=(python-setuptools)
source=("https://github.com/kplindegaard/smbus2/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a602790a98c21ac4de9afd49d3d771e942c39257a7e670f807516248ec7a5e7b')

package() {
	cd "$srcdir/smbus2-$pkgver"
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
