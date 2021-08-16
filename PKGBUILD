# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>

pkgname=osso-bookmark-engine
pkgver=2.0.0
pkgrel=1
pkgdesc="Basic library for Maemo applications"
arch=("x86_64" "i686")
url="https://github.com/maemo-leste/$pkgname"
license=('LGPL2.1')
depends=()
makedepends=('gconf' 'glib2' 'libxml2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maemo-leste/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f19cfd615c7658c9da7ada8d53c398f7f6ec9bd6ac5c99f6bb85551ec9db9f7865507a00a877f32ebf15924d69c4f85d5d444443b817a27ca9da4bb176bab323')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  libtool --finish /usr/lib
}
