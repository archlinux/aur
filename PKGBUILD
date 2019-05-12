# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=distccd-arch-arm
pkgver=1.01
pkgrel=1
pkgdesc="Provides an Arch ARM client with Systemd services/environment files to make use of distcc-alarm naively."
arch=('armv5' 'armv6h' 'armv7h' 'armv8')
url="https://github.com/graysky2/distccd-arch-arm"
license=('MIT')
depends=('distcc')
optdepends=('distccd-alarm: recommended on the x86_64 volunteer machine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b2e6058aa7aee2d77715a3ebb6bd305af53917a5a5b5cc8311de72dd6af5a251')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
