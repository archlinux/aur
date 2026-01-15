# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@gmail.com>

pkgname=libtsm
pkgver=4.4.0
pkgrel=1
pkgdesc='Terminal-emulator State Machine'
arch=('x86_64')
url='https://github.com/kmscon/libtsm'
license=('MIT')
depends=('glibc')
makedepends=('meson' 'check' 'libxkbcommon')
options=(!libtool)
source=("${url}/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('261e7a420aef465ddcee52685acc7809beea05d563ee42435e8f01d2a6f20dd1d16432e1274eeb919f121b9ee770e43af9c9755ec96234ee1c1cfae950b29089')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
