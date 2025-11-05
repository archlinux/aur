# Maintainer: BigBrainRobin29

pkgname=scrcpy-bin
pkgver=3.3.3
pkgrel=1
pkgdesc="Display and control your Android device"
arch=('x86_64')
url="https://github.com/Genymobile/scrcpy"
license=("Apache-2.0")
depends=('glibc' 'libcap' 'systemd-libs' 'android-tools')
optdepends=('libusb: USB connection support')
provides=('scrcpy')
conflicts=('scrcpy')
source=("https://github.com/Genymobile/scrcpy/releases/download/v${pkgver}/scrcpy-linux-x86_64-v${pkgver}.tar.gz")
sha256sums=('9b30e813e8191329ba8025dc80cb0f198fb0a318960a3b5c15395cf675c9c638')

package() {
    cd "$srcdir/scrcpy-linux-x86_64-v${pkgver}"

    install -Dm755 scrcpy -t "$pkgdir/usr/bin/"
    install -Dm644 scrcpy-server -t "$pkgdir/usr/bin/"
    install -Dm644 scrcpy.1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/scrcpy.png"
}