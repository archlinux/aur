pkgname=simplelaunch
pkgver=1.0
pkgrel=1
pkgdesc="A lightweight CLI tool to detach GUI apps from the terminal, with easy job listing and log viewing for tiling WM users (i3, Hyprland, Sway)"
arch=('any')
url="https://github.com/itsflameee/simplelaunch"
license=('MIT')
depends=('bash' 'util-linux' 'procps-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fdbc61fe75bdf6a2646bba8ecab7cebee6b9b476b27666910a169e536cd38b3b')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 bin/launch "$pkgdir/usr/bin/launch"
    install -Dm755 bin/slaunch "$pkgdir/usr/bin/slaunch"

    install -Dm644 simplelaunch/slaunch.conf "$pkgdir/etc/simplelaunch/slaunch.conf"
    install -Dm644 simplelaunch/emojis.txt "$pkgdir/etc/simplelaunch/emojis.txt"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
