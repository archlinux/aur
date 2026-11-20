# Maintainer: LIghtJUNction
pkgname=zcalld-bin
pkgver=0.4.4
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
sha256sums_x86_64=('26cd84f9a6093b5b73bd5f6c2c7f068270a1c7e4fad0c91c7a5c2e3be8776956')
sha256sums_aarch64=('0ad2416cc41bccf8d493a99d3b6b10b11a212cb65793f8cde180edeee96f0973')

package() {
  cd "zcalld-$pkgver-$CARCH-unknown-linux-gnu"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
  mv "$pkgdir/usr/share/licenses/zcalld" "$pkgdir/usr/share/licenses/$pkgname"
}
