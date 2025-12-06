# Maintainer: Skycoder42 <Skycoder42@users.noreply.github.com>
pkgbase='bw-pinentry'
pkgname=('bw-pinentry' 'bw-pinentry-debug')
pkgdesc='A pinentry wrapper around the bitwarden CLI to use your vault for GPG-Key storage.'
pkgver='1.0.4'
pkgrel=1
arch=('x86_64')
url='https://github.com/Skycoder42/bw-pinentry'
license=('BSD')
depends=('pinentry' 'bitwarden-cli')
source=("sources.tar.gz::https://github.com/Skycoder42/bw-pinentry/archive/refs/tags/v1.0.4.tar.gz"
        "bin.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.4/binaries-linux.tar.xz"
        "debug.tar.xz::https://github.com/Skycoder42/bw-pinentry/releases/download/v1.0.4/binaries-linux-debug-symbols.tar.xz")
b2sums=('8e14e50e9558141ea4d83cff2e76802bbe10941c6f36e640ae5494c438df4fb74433d5f883356e6a0799da580ddc1b555b9099064cf594eb180081b0fab558fc'
        'cbd3902984cd13d8d3743e0ad9c6544bd7fb6b352d7a562052af31e4f7ac4c1eb783bf2bb52385f4bc2f4776035187012f02e19b4cb0920281d65af2cf62b27b'
        '4426334bd942dd14ea53de44670c74db58bec68f998db0754096cf6344ad77e18e0750621a04cecfabc9628990891024d66fdf0772a620bf142fa21971efad20')
changelog='CHANGELOG.md'
options=('!strip')
_pkgdir="$pkgbase-$pkgver"

package_bw-pinentry() {
  install -D -m755 'bw-pinentry' "$pkgdir/usr/bin/"'bw-pinentry'
  cd "$_pkgdir"
  install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"'LICENSE'
}

package_bw-pinentry-debug() {
  install -D -m644 'bw-pinentry.sym' "$pkgdir/usr/lib/debug/usr/bin/"'bw-pinentry'.sym
  cd "$_pkgdir"
  find . -exec install -D -m644 "{}" "$pkgdir/usr/src/debug/$pkgbase/{}" \;
}

