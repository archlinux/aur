# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=clock-tui-bin
_pkgname=clock-tui
pkgver=0.11.1
pkgrel=1
pkgdesc="A terminal clock app with clock, timer, stopwatch, countdown, and clock widgets (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/clock-tui"
license=('MIT')
depends=('gcc-libs')
optdepends=('jq: timer parsing in the tclock-system-health example widget'
            'btrfs-progs: btrfs health row in the tclock-system-health example widget')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-debug")
options=('!strip' '!debug')

source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_x86_64=('265a49b4031a40c61c8f98d280576d27ed24df78e710f3b7be4bbf7f800941f8')
sha256sums_aarch64=('3d50544bd23d5694067b90a14e7daae440eef62b042d1cce58cac2a3b6d2a01a')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "tclock"
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "tclock-system-health"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "README.md"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "docs/widget-themes.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
