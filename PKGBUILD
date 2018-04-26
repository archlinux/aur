# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=onyx
pkgver=0.4.2
pkgrel=3
pkgdesc='Decentralized messaging application based on PSS'
arch=(any)
url='https://mainframe.com'
license=(MIT)
depends=(yarn)
makedepends=(libicns)
conflicts=(onyx-bin)
options=(!strip)
source=(https://github.com/MainframeHQ/onyx/archive/v$pkgver.zip)
sha512sums=(0c169df9d0e29677dc7621b5ffeee78d9ba41243e0122d4116bec93245f04be498208752e2432779f62f3c9ff551019cb436247cc34e9ea078cea1992f72e194)

build() {
  cd $srcdir/onyx-$pkgver
  yarn
  yarn build:binaries
  yarn dist
}

package() {
  cd $srcdir/onyx-$pkgver
  install -Dm 755 dist/Mainframe\ Alpha.AppImage $pkgdir/usr/bin/onyx
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/onyx/LICENSE
}
