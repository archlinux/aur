# Maintainer: LIghtJUNction
pkgname=zcalld-bin
pkgver=0.1.1
pkgrel=2
pkgdesc='Compact Linux AI gateway built on zcall with native zplugin extensions (binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld'
license=('MIT')
depends=('glibc' 'libgcc' 'curl')
optdepends=('systemd: system and user service management')
provides=("zcalld=$pkgver")
conflicts=('zcalld')
backup=('etc/zcalld/config.conf')
options=('!strip')
source_x86_64=("$url/releases/download/v$pkgver/zcalld-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/zcalld-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7d558a50e50f73ae2f65c60bd3faebcddd59c344c3bc6b1bcb25319410b15b3e')
sha256sums_aarch64=('da86ac0a8671566bd14fa6cfc8cc1edc9b36e303e1dacfa012ed8589623369ac')

package() {
  cd "zcalld-$pkgver-$CARCH-unknown-linux-gnu"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
  mv "$pkgdir/usr/share/licenses/zcalld" "$pkgdir/usr/share/licenses/$pkgname"
}
