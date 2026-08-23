# Maintainer: mzwing <mzwing@mzwing.eu.org>

_pkgname=latchshot
pkgname=latchshot-bin
_pkgver=0.2.5
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc='A lightweight yet intelligent window-aware screenshot tool for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/so1ve/latchshot'
license=('MIT')
depends=('gcc-libs' 'glibc' 'libxkbcommon' 'wayland' 'wl-clipboard')
provides=("$_pkgname=$pkgver")
conflicts=('latchshot' 'latchshot-git')
source=("LICENSE::$url/raw/v$_pkgver/LICENSE")
source_x86_64=("$_pkgname-x86_64-unknown-linux-gnu::$url/releases/download/v$_pkgver/$_pkgname-x86_64-unknown-linux-gnu")
source_aarch64=("$_pkgname-aarch64-unknown-linux-gnu::$url/releases/download/v$_pkgver/$_pkgname-aarch64-unknown-linux-gnu")
sha256sums=('4d36a113b0a6a584805f0537e0126a382ca425d544c5ae4302b260c56ad42c83')
sha256sums_x86_64=('7e56c7f60756ca85ac14381adfa6fdc01783cbb1ce5424ee93c97795efcae28a')
sha256sums_aarch64=('0a8e74f294273889f34ce59298512d3f5762c5fc07826975bad7e715d8fede66')

package() {
    install -Dm755 "$_pkgname-$CARCH-unknown-linux-gnu" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
