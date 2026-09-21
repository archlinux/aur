# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=clock-tui-bin
_pkgname=clock-tui
pkgver=0.15.0
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
sha256sums_x86_64=('ad0841730be216c151e2302f7c0145c12e210ba3a67e49f0ab1bee973f0807d0')
sha256sums_aarch64=('583a4834dada91c1d284bb47a5b3d0fe5975b23f07e4d9239e4cb69e3aa02801')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "tclock"
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "tclock-system-health"
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "tclock-weather"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "README.md"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "docs/widget-themes.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
