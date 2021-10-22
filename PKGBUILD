# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>
# Contributor: dmitry.romanov <dmitry.romanov85@gmail.com>

pkgname=fman
pkgver=1.7.3
pkgrel=1
pkgdesc="Dual-pane file manager"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
source=("$url/updates/arch/fman-$pkgver.pkg.tar.xz")
sha256sums=('7ecb4bf9d8202d5e18b1e0a75d5837a7e83f3c3527fc95d7f61353696a4981dc')

package() {
    cd "$srcdir"

    # Application directory
    install -dm755 "$pkgdir"/opt
    cp --preserve=mode -r opt/fman "$pkgdir"/opt/fman

    # Icons
    for res in usr/share/icons/hicolor/*; do
        install -Dm644 usr/share/icons/hicolor/${res##*/}/apps/fman.png -t "$pkgdir"/usr/share/icons/hicolor/${res##*/}/apps
    done

    # Executable and desktop entry
    install -Dm755 usr/bin/fman -t "$pkgdir"/usr/bin
    install -Dm644 usr/share/applications/fman.desktop -t "$pkgdir"/usr/share/applications
}
