# Maintainer: PowerShell Token Killer contributors
pkgname=ptk-bin
pkgver=0.3.0rc6
pkgrel=1
pkgdesc='Warm PowerShell MCP sessions with compact, recoverable output'
arch=('x86_64' 'aarch64')
url='https://github.com/AlsoBeltrix/PowerShell-Token-Killer'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'icu' 'openssl' 'krb5' 'zlib' 'rtk')
provides=('ptk')
conflicts=('ptk')
options=('!strip' '!debug')
source_x86_64=('ptk-0.3.0-rc.6-linux-x64.tar.gz::https://github.com/AlsoBeltrix/PowerShell-Token-Killer/releases/download/v0.3.0-rc.6/ptk-0.3.0-rc.6-linux-x64.tar.gz')
sha256sums_x86_64=('1cb4615f1ca45450daa56b1c7ba40a5e9d99e60331f887887368aaa38b750f48')
source_aarch64=('ptk-0.3.0-rc.6-linux-arm64.tar.gz::https://github.com/AlsoBeltrix/PowerShell-Token-Killer/releases/download/v0.3.0-rc.6/ptk-0.3.0-rc.6-linux-arm64.tar.gz')
sha256sums_aarch64=('323acbf528f351e33454f3552582315c5599f046f3f3c8e6edcf5f3669111c4c')

package() {
  install -d "$pkgdir/usr/lib/ptk" "$pkgdir/usr/bin"
  cp -a "$srcdir/bin" "$srcdir/scripts" "$srcdir/src" "$pkgdir/usr/lib/ptk/"
  install -m644 "$srcdir/VERSION" "$srcdir/BUILD-PROVENANCE.json" "$srcdir/LICENSE" "$srcdir/README.md" "$pkgdir/usr/lib/ptk/"
  ln -s /usr/lib/ptk/bin/ptk "$pkgdir/usr/bin/ptk"
}
