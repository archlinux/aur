# Maintainer: LIghtJUNction
pkgname=zcalld-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Compact Linux AI gateway built on zcall with native zplugin extensions (binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zcalld'
license=('MIT')
depends=('glibc' 'libgcc' 'curl')
optdepends=('systemd: system and user service management' 'zcalld-compat>=0.1.3: privacy, audit history, OAuth accounts and community plugins' 'zcall-gui: optional native desktop interface' 'libsecret: configure Zed credentials through Secret Service')
provides=("zcalld=$pkgver")
conflicts=('zcalld')
backup=('etc/zcalld/config.conf')
options=('!strip')
source_x86_64=("$url/releases/download/v$pkgver/zcalld-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/zcalld-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('806070ec4e4fca8d5fbf992d454a648ab1227ae29905b8891f067b08f2bbe18d')
sha256sums_aarch64=('66297bc7f19775e363cf14053e378446d007064c240112efcf8e7c7dbb563e76')

package() {
  cd "zcalld-$pkgver-$CARCH-unknown-linux-gnu"
  DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
  mv "$pkgdir/usr/share/licenses/zcalld" "$pkgdir/usr/share/licenses/$pkgname"
}
