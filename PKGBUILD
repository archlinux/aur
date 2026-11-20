# Maintainer: LIghtJUNction
pkgname=zcalld-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='Compact Linux AI gateway built on zcall with native zplugin extensions (binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld'
license=('MIT')
depends=('glibc' 'libgcc' 'curl')
optdepends=('systemd: system and user service management' 'zcalld-compat>=0.1.5: privacy, audit history, OAuth accounts and community plugins' 'zcall-gui: optional native desktop interface' 'libsecret: configure Zed credentials through Secret Service')
provides=("zcalld=$pkgver")
conflicts=('zcalld')
backup=('etc/zcalld/config.conf')
options=('!strip')
source_x86_64=("$url/releases/download/v$pkgver/zcalld-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/zcalld-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('93234715421e4f95de43191d77c6fdf4b7cf923adb9b8df15beed0deb854b96a')
sha256sums_aarch64=('ff9e38cd0c4ba5c3480613557c5cae9d31bdb86aa360238866419c92f05e6dba')

package() {
  cd "zcalld-$pkgver-$CARCH-unknown-linux-gnu"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
  mv "$pkgdir/usr/share/licenses/zcalld" "$pkgdir/usr/share/licenses/$pkgname"
}
