# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=depthcharge
pkgver=0.1.1
pkgrel=1
pkgdesc="toolkit for security research and jailbreaking of platforms using U-Boot"
arch=('any')
url="https://depthcharge.readthedocs.io/en/latest/scripts/index.html"
license=('BSD')
depends=(
  'python'
  'python-pyserial'
  'python-tqdm'
)
provides=("$pkgname")
options=(!emptydirs)
source=(https://github.com/nccgroup/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('5eab7a26f51dcd2b5aef7054c3eaaaffab1d68cf2c58354c84c87019ea55e90c61ae910340d0638c25cf57269410803692c56002dd648626011ff2132e8b01a5')

package() {
  cd "$srcdir/${pkgname}-$pkgver/python"
  python setup.py install --root="$pkgdir/" --optimize=1
  cd ..
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
