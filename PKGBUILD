# Maintainer: mzwing <mzwing@mzwing.eu.org>

_pkgname=latchshot
pkgname=latchshot-bin
_pkgver=0.3.0
pkgver=${_pkgver//-/_}
pkgrel=1
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
sha256sums_x86_64=('1ce00be05f2093d44388f61c97a881084b665d7d2728e03ce9c5eef8bde57c98')
sha256sums_aarch64=('43e0893f6d7a7aa815400d4732f063600e77c45a88b71247997b1f52c2d7841e')

package() {
    install -Dm755 "$_pkgname-$CARCH-unknown-linux-gnu" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
