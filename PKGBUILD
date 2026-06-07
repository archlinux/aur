# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=clock-tui-bin
_pkgname=clock-tui
pkgver=0.6.6
pkgrel=1
pkgdesc="A terminal clock app with clock, timer, stopwatch, countdown, and clock widgets (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/clock-tui"
license=('MIT')
depends=('gcc-libs')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-debug")
options=('!strip' '!debug')

source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_x86_64=('d1a7d12bb33cd01ee32389da0749d848bc84e10d029baf71f1bf38d34f311efc')
sha256sums_aarch64=('42e4ac024a52b0ea8b109715fa13c2e8943eb7680fd79f393a2611de41bb3aa3')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "tclock"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
