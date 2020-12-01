# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=depthcharge
pkgver=0.2.0
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
sha512sums=('827c4eb3c0c01251c431f14538465ff3eded9cda3a277d2e2f21453f7c87218ae43a98e7a647445e5bf1642f9ef94553e84acf13f85e8a77dc6a369fa5f424a3')

package() {
  cd "$srcdir/${pkgname}-$pkgver/python"
  python setup.py install --root="$pkgdir/" --optimize=1
  cd ..
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
