# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@gmail.com>

pkgname=libtsm
pkgver=4.3.0
pkgrel=1
pkgdesc='Terminal-emulator State Machine'
arch=('x86_64')
url='https://github.com/kmscon/libtsm'
license=('MIT')
depends=('glibc')
makedepends=('meson' 'check' 'libxkbcommon')
options=(!libtool)
source=("${url}/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('fc8071011e4c8833c96e6e2aa09490ddd51f6468e11c87e3ae58f818db29b11c737d9c6440539be108a636f36dabee1148beaf6a24a59f4f102bc99b52eee95c')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
