# Maintainer: Daniel Reibl <janos.daniel.reibl@pm.me>
pkgname=firecapture
pkgver=2.7.15
pkgrel=1
pkgdesc="Astrophotography/planetary image capture software"
arch=('x86_64' 'aarch64')
url="https://firecapture.de/"
license=('custom:firecapture')
depends=('libusb')
source=()
sha256sums=()
source_x86_64=('https://github.com/riblee/ppa/raw/3444cffcf5ceb18d47766e5108c91f66723dcf30/FireCapture_v2.7.15.deb')
sha256sums_x86_64=('5b555735f85cb85da36bd29fb1a1690eae45f555cdb909d5e724f6402619ebba')
source_aarch64=('https://github.com/devDucks/astroarch-pkgs/raw/95942313cf1629f4bff2ef6557ffaaface638823/packages/fire_capture/firecapture_2.7.15_aarch64.deb')
sha256sums_aarch64=('03f6030ec96578d0317166d7be178c34fc7d69f8b0391dcb3c8681ad3f3ad0c4')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "$pkgdir/"
    chmod 755 "$pkgdir/opt"
    chmod 755 "$pkgdir/usr"
    chmod 755 "$pkgdir/usr/share"
    chmod 755 "$pkgdir/usr/share/applications"

    # License
    install -Dm644 "$pkgdir/opt/FireCapture_v2.7/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
