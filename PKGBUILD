#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=tldx-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Domain Availability Research Tool"
arch=('x86_64' 'aarch64')
conflicts=('tldx')
provides=('tldx')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/brandonyoungdev/tldx/releases/download/v$pkgver/tldx_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/brandonyoungdev/tldx/releases/download/v$pkgver/tldx_${pkgver}_linux_arm64.tar.gz")
url="https://github.com/brandonyoungdev/tldx"
license=("Apache-2.0")
sha256sums_x86_64=('b88b445a15caa101728fbc7f058c1f442ffe49e16c5e5c5145c2b911f1fd34ba')
sha256sums_aarch64=('75ef106ba547e5fbce24188633b77e428d3ec3ef3fd49027897a1c8b06a21add')
options=(!debug)

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "tldx" "$pkgdir/usr/bin/tldx"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/tldx/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/tldx/LICENSE"
}
