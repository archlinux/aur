# Maintainer: Pasqual Troncone <pasqualtroncone at gmail dot com>

pkgname=ai-jail-bin
_pkgname=ai-jail
pkgver=0.8.3
pkgrel=1
pkgdesc='Sandbox for AI coding agents (bubblewrap on Linux, sandbox-exec on macOS) — prebuilt binary'
arch=('x86_64')
url='https://github.com/akitaonrails/ai-jail'
license=('GPL-3.0-only')
depends=('bubblewrap' 'glibc' 'gcc-libs')
optdepends=(
    'mise: language version management inside the sandbox'
    'docker: Docker socket passthrough'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/akitaonrails/ai-jail/releases/download/v$pkgver/ai-jail-linux-$CARCH.tar.gz"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/akitaonrails/ai-jail/v$pkgver/LICENSE"
)
sha256sums=(
    'c881e0bcae473761a0217dde63040a45b64b9fcdd99e37dabc1b7cabd904e81c'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
    install -Dm0644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
