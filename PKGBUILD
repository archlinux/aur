# Maintainer: Valdemar Erk <aur@erk.dev>

pkgname=mlkit-bin
pkgver=4.7.12
pkgrel=2
pkgdesc='Standard ML Compiler and Toolkit'
url='http://www.elsman.com/mlkit/'
license=('GPL2')
arch=('x86_64')
depends=('gmp')
makedepends=()
source=("https://github.com/melsman/mlkit/releases/download/v$pkgver/mlkit-bin-dist-linux.tgz")
sha256sums=('7c297ce5e8b45631700579c7fa128842bd02d8a93ec2672ab8fcd98ad743b3ce')
provides=("mlkit")
conflicts=("mlkit")

package() {
  cd "mlkit-bin-dist-linux"
  make PREFIX="$pkgdir/usr" install
  mkdir -p "$pkgdir/usr/local/etc/mlkit/"
  mkdir -p "$pkgdir/usr/local/etc/smltojs/"
  echo "SML_LIB /usr/lib/mlkit" > "$pkgdir/usr/local/etc/mlkit/mlb-path-map"
  echo "SML_LIB /usr/lib/smltojs" > "$pkgdir/usr/local/etc/smltojs/mlb-path-map"
}
