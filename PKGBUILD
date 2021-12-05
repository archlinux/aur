# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=depthcharge
pkgver=0.3.0
pkgrel=1
pkgdesc="Security research and jailbreaking toolkit for platforms using U-Boot"
arch=('any')
url="https://depthcharge.readthedocs.io/en/latest/scripts/index.html"
license=('BSD')
depends=(
  'python'
  'python-pyserial'
  'python-tqdm'
)
optdepends=(
  'dtc: needed for depthcharge-find-fdt'
)
provides=("$pkgname")
options=(!emptydirs)
source=(https://github.com/nccgroup/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('a370b37e0927017f25134539297af497994d57943282087926c1e8c8a0bad9490d4260181475cffaca40b01d75e2f49e4217e6fdc9ebe838aabffaa5a6eb9a25')

package() {
  cd "$srcdir/${pkgname}-$pkgver/python"
  python setup.py install --root="$pkgdir/" --optimize=1
  cd ..
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
