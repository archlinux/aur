# Maintainer: Benoît Rouits <brouits at free dot fr>
pkgname=qabc
pkgver=1.9.2
pkgrel=1
pkgdesc="ABC music notation minimal GUI."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/be1/qabc"
license=('GPL3')
depends=('qt5-base' 'abcm2ps' 'abcmidi' 'fluidsynth' 'shared-mime-info')
makedepends=('qt5-tools')
groups=(abc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/be1/qabc/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('d91adb00526bfc63b4e3fdb3f267126366296ef59976ccce51595490abe3a6b8e0f65a2e78e151b7ed264234147658bcb03fb59395905fb8f104af8b7ade5b54')

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
