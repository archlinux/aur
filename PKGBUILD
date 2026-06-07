# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=clock-tui-bin
_pkgname=clock-tui
pkgver=0.6.5
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
sha256sums_x86_64=('b33a7964785adcd2062e83a0ee2e224a8a489d66fb271a2ed86e1bdc8b935a18')
sha256sums_aarch64=('c4c0fda57763784e8f9f8b89d139f7d60faddd34316f031e99614b4854523fb0')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "tclock"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
