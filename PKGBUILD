# Maintainer: BigBrainRobin29

pkgname=scrcpy-bin
pkgver=3.3.4
pkgrel=1
pkgdesc="Display and control your Android device"
arch=('x86_64')
url="https://github.com/Genymobile/scrcpy"
license=("Apache-2.0")
depends=('glibc' 'libcap' 'systemd-libs' 'android-tools')
optdepends=('libusb: USB connection support')
provides=('scrcpy')
conflicts=('scrcpy')
source=("https://github.com/Genymobile/scrcpy/releases/download/v${pkgver}/scrcpy-linux-x86_64-v${pkgver}.tar.gz" 'scrcpy.desktop')
sha256sums=('0305d98c06178c67e12427bbf340c436d0d58c9e2a39bf9ffbbf8f54d7ef95a5' '17c3b3eda5c73b754e08f6eba4bccede72f0a1c00149ff800539319073ca3587')

package() {
    cd "$srcdir/scrcpy-linux-x86_64-v${pkgver}"

    install -Dm755 scrcpy -t "$pkgdir/usr/bin/"
    install -Dm644 scrcpy-server -t "$pkgdir/usr/bin/"
    install -Dm644 scrcpy.1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 "$srcdir/scrcpy.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/scrcpy.png"
}