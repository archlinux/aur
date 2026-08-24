# Maintainer: xihale <i@xihale.top>
# Contributor: xihale <i@xihale.top>
pkgname=snirect-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Local HTTP/HTTPS proxy that rewrites TLS SNI by rules to bypass SNI-based censorship (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/xihale/snirect'
license=('MIT')
depends=()
optdepends=(
  'ca-certificates: HTTPS MITM decryption'
  'nss: Firefox certificate store integration'
)
provides=('snirect')
conflicts=('snirect')
options=('!strip')
source=('LICENSE::https://raw.githubusercontent.com/xihale/snirect/v'"$pkgver"'/LICENSE')
sha256sums=('9170853f5f6a075badb2db222f98d1ae66eaac2f9a9bde463aa085f7711c25fc')
source_x86_64=("$pkgname-$pkgver-$CARCH::https://github.com/xihale/snirect/releases/download/v$pkgver/snirect-linux-amd64")
sha256sums_x86_64=('bde61e775643e8930058cceb029c856e9bdc0b5197e3a8de50dd776ef45f21ef')
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/xihale/snirect/releases/download/v$pkgver/snirect-linux-arm64")
sha256sums_aarch64=('5330675a3e00fff14ae55cf6ac1868e82f6080a72727da0131f186a0fc6ceec1')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-${CARCH}" "$pkgdir/usr/bin/snirect"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
