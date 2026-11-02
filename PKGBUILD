# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=clock-tui-bin
_pkgname=clock-tui
pkgver=0.16.0
pkgrel=1
pkgdesc="A terminal clock app with clock, timer, stopwatch, countdown, and clock widgets (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/clock-tui"
license=('MIT')
depends=('gcc-libs')
optdepends=('curl: fetch weather data for the tclock-weather example widget'
            'jq: faster JSON parsing in the tclock-weather and tclock-system-health example widgets'
            'btrfs-progs: btrfs health row in the tclock-system-health example widget')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-debug")
options=('!strip' '!debug')

source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_x86_64=('8e607de226477bf3bf6cbe95be39a181028c8636965ceda8eb63c73887f6b57a')
sha256sums_aarch64=('c0e0f8e3f0eda839667a980907c4a5e35708820bd84682393eeb7cfa1d9acf3f')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "tclock"
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "tclock-system-health"
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "tclock-weather"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "README.md"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "docs/widget-themes.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
