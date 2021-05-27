# Maintainer: Benoît Rouits <brouits at free dor fr>
pkgname=qabc
pkgver=1.5
pkgrel=1
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt5-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'shared-mime-info')
makedepends=('qt5-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/$pkgver.tar.gz")
sha512sums=('9e29c55fbe3f56116af088c721c6e3784f7a97b7dd580f3504d114c40b4789da5a9c22cd12e0b92970956e255ed73a863accc6496b1bf3a98bca3b571658b4e9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake PREFIX=/usr -config release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
