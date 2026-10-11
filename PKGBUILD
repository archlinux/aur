# Maintainer: Igor Deyashkin <ovsyanka42 at gmail dot com>
# Contributor: Sneakatoo <corinne.9 at hotmail.it>
# Contributor: Pellegrino Prevete <pellegrinoprevete at gmail.com>
# Contributor: Martin Patz <mailto at martin-patz.de>
# Contributor: Nicky Heinimann <nicky.heinimann at posteo.de>
# Contributor: milkii

pkgname=indicator-sound-switcher
pkgver=2.3.10.1
pkgrel=2
pkgdesc="Sound input/output selector indicator for Linux."
arch=('any')
url="https://github.com/yktoo/indicator-sound-switcher"
license=('GPL-3.0-or-later')
makedepends=('python-setuptools')
depends=('python' 'python-gobject' 'libkeybinder3' 'libappindicator-gtk3' 'pulse-native-provider')
options=(!emptydirs)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/yktoo/${pkgname}/archive/v${pkgver}.tar.gz"
    "fix-pkg-resources.patch::https://github.com/yktoo/${pkgname}/commit/6756be87ba9a139ec3fe3d84b0300c6db04f54ba.patch"
)
sha256sums=('54c50b04b8a337ace3dcc5345c033e88eeaa298d54a082428e01e7467ca74930'
            '552f21cc9a487467a3b69967e67c5533c10fd04484f2ce26c5afe2348bfebe9f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/fix-pkg-resources.patch"
}
# vim:set ts=2 sw=2 et:
