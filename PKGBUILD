# Maintainer: Martin Knudsen <martin.knudsen@gmail.com>

pkgname=swamp
pkgver=0.8
pkgrel=1
pkgdesc="Teh AWS profile manager"
arch=('x86_64'  )
url="https://github.com/felixb/swamp"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/felixb/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('199650fc5c0a25907b608d2a0a17086f83b5031bbaea39a729f649d2df422f16')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "${pkgname}_amd64" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
