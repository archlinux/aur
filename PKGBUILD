# Maintainer: Shni <niamelyrz@gmail.com>

pkgname=moto-buds-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Motorola Moto Buds companion CLI and Qt6/QML desktop application (precompiled binaries)"
arch=('x86_64')
url="https://github.com/Shnimlz/moto-buds-linux"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-declarative'
    'bluez'
    'hicolor-icon-theme'
)
provides=('moto-buds' 'moto-buds-gui')
conflicts=('moto-buds' 'moto-buds-git' 'moto-buds-appimage')
source=("$url/releases/download/v$pkgver/moto-buds-linux-x86_64.tar.gz")
sha256sums=('4e247f9433d21c62a9e19466fbe88c82a6c094a537be0c2eff6851900e88a73b')

package() {
    cd "$srcdir/moto-buds-linux-x86_64"

    install -Dm755 moto-buds "$pkgdir/usr/bin/moto-buds"
    install -Dm755 moto-buds-gui "$pkgdir/usr/bin/moto-buds-gui"

    install -Dm644 com.motorola.motobuds.desktop "$pkgdir/usr/share/applications/com.motorola.motobuds.desktop"
    install -Dm644 com.motorola.motobuds.metainfo.xml "$pkgdir/usr/share/metainfo/com.motorola.motobuds.metainfo.xml"

    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/moto-buds.png"
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/192x192/apps/moto-buds.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
