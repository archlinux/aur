# Maintainer: Benoît Rouits <brouits at free dot fr>
pkgname=qabc
pkgver=1.11
pkgrel=1
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt5-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'shared-mime-info')
makedepends=('qt5-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('00cc32921c7227cf729521bb4e05be4e580f35411a9121d39deb357e0013958676ef21823ba2310805329953d17f284051172e579a6f428d64ccde34cfc242a5')

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
