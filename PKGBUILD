# Maintainer: PowerShell Token Killer contributors
pkgname=ptk-bin
pkgver=0.3.0rc5
pkgrel=1
pkgdesc='Warm PowerShell MCP sessions with compact, recoverable output'
arch=('x86_64' 'aarch64')
url='https://github.com/AlsoBeltrix/PowerShell-Token-Killer'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'icu' 'openssl' 'krb5' 'zlib' 'rtk')
provides=('ptk')
conflicts=('ptk')
options=('!strip' '!debug')
source_x86_64=('ptk-0.3.0-rc.5-linux-x64.tar.gz::https://github.com/AlsoBeltrix/PowerShell-Token-Killer/releases/download/v0.3.0-rc.5/ptk-0.3.0-rc.5-linux-x64.tar.gz')
sha256sums_x86_64=('58aa1425e6f81e3240508f59f23b68bc5401b404cd30534752ccbc371bde5245')
source_aarch64=('ptk-0.3.0-rc.5-linux-arm64.tar.gz::https://github.com/AlsoBeltrix/PowerShell-Token-Killer/releases/download/v0.3.0-rc.5/ptk-0.3.0-rc.5-linux-arm64.tar.gz')
sha256sums_aarch64=('0788a36cf59345f2491ae014f367dcd07414d1af0a042ac1a573b5b1489b41e2')

package() {
  install -d "$pkgdir/usr/lib/ptk" "$pkgdir/usr/bin"
  cp -a "$srcdir/bin" "$srcdir/scripts" "$srcdir/src" "$pkgdir/usr/lib/ptk/"
  install -m644 "$srcdir/VERSION" "$srcdir/BUILD-PROVENANCE.json" "$srcdir/LICENSE" "$srcdir/README.md" "$pkgdir/usr/lib/ptk/"
  ln -s /usr/lib/ptk/bin/ptk "$pkgdir/usr/bin/ptk"
}
