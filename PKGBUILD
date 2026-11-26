# Maintainer: LIghtJUNction
pkgname=zcalld-bin
pkgver=0.4.8
pkgrel=1
pkgdesc='Compact Linux AI gateway built on zcall with native zplugin extensions (binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld'
license=('MIT')
depends=('glibc' 'libgcc' 'curl' 'zstd' 'zlib')
optdepends=('systemd: system and user service management' 'zcalld-compat>=0.3.1: privacy, audit history, OAuth accounts and community plugins' 'zcall-gui: optional native desktop interface' 'libsecret: configure Zed credentials through Secret Service')
provides=("zcalld=$pkgver")
conflicts=('zcalld')
backup=('etc/zcalld/config.conf')
options=('!strip')
source_x86_64=("$url/releases/download/v$pkgver/zcalld-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/zcalld-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ae783000524e5b0d2f6e7eb57076ca6b598bc01765ce81c26c1ece16c854f82d')
sha256sums_aarch64=('b5e5e9f840ea821d950dda249e192a825dd9015af54391f6139f123092c522fe')

package() {
  cd "zcalld-$pkgver-$CARCH-unknown-linux-gnu"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
  mv "$pkgdir/usr/share/licenses/zcalld" "$pkgdir/usr/share/licenses/$pkgname"
}
