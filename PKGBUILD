# Maintainer: acceleration3 <acceleration23@gmail.com>
pkgname=mi-home-toolkit-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Effortlessly manage Mi Home smart devices, such as viewing device info and enabling LAN mode for bulbs."
arch=('x86_64')
url="https://github.com/ApplY3D/mi-home-toolkit"
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/MiHomeToolkit-$pkgver-linux_amd64.deb")
sha256sums=('5804992ba50d041d50b24471420d71346e939b069d5403e10690fb70c2accfd0')

prepare() {
    cd "$srcdir"
    ar x "$pkgname-$pkgver.deb"
    tar -xzf data.tar.gz
}

package() {
    cd "$srcdir"

    install -Dm755 "usr/bin/mi-home-toolkit" "$pkgdir/usr/bin/mi-home-toolkit"
    install -Dm644 "usr/share/applications/Mi Home Toolkit.desktop" \
        "$pkgdir/usr/share/applications/mi-home-toolkit.desktop"
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/mi-home-toolkit.png" \
        "$pkgdir/usr/share/pixmaps/mi-home-toolkit.png"
}
