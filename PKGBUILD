# Maintainer: Kim Scarborough <kim@scarborough.kim>
# Contributor: rern <rernrern@gmail.com>

pkgname=python-smbus2
pkgver=0.5.0
pkgrel=1
pkgdesc='A drop-in replacement for smbus-cffi/smbus-python'
url="https://github.com/kplindegaard/smbus2"
license=(MIT)
arch=(any)
depends=(python)
makedepends=(python-setuptools)
source=("https://github.com/kplindegaard/smbus2/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3bdbe5e724280ea2cbd2efd84a9dfe47df46c0121945e4543f996e86323c351b')

package() {
	cd "$srcdir/smbus2-$pkgver"
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
