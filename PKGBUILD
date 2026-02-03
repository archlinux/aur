# Maintainer: Lorenzo La Spina <llaspina@crystalbluegames.com>
# Maintainer: Gabriele Sani <gabriele@crystalbluegames.com>

pkgname=minecart-gui
pkgver=2026.1.0.0
pkgrel=1
pkgdesc="Minecart Asset Management Client for Shard Engine"
arch=(x86_64)
url="https://skyforge.crystalbluegames.com/CrystalBlueDevelopers/minecart"
license=(GPL-2)
depends=(qt6-base)

source_x86_64=("https://skyforge.crystalbluegames.com/CrystalBlueDevelopers/minecart/releases/download/${pkgver}/minecart-${pkgver}-Linux.tar.gz")
sha256sums_x86_64=('dcf6cb534faf2229209ba4800004e0c8ed6889d863082d13d0817bb4fffe35b0')

prepare() {
    tar xzvf "minecart-${pkgver}-Linux.tar.gz"
}

package() {
    install -Dm0755 "$srcdir/minecart-${pkgver}-Linux/bin/minecart-gui" "$pkgdir/usr/bin/minecart-gui"
    install -Dm0755 "$srcdir/minecart-${pkgver}-Linux/lib/libminecart.so" "$pkgdir/usr/lib/libminecart.so"
}

post_install() {
    ldconfig
}
