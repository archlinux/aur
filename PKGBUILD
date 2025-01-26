# Maintainer: Daniel Reibl <janos.daniel.reibl@pm.me>
pkgname=firecapture
pkgver=2.7.14
pkgrel=1
pkgdesc="Astrophotography/planetary image capture software"
arch=('x86_64')
url="https://firecapture.de/"
license=('custom:firecapture')
depends=('libusb')
source=()
sha256sums=()
source_x86_64=('https://github.com/riblee/ppa/raw/7f61fe51b8d603d81deeecf630a4a9a2a4f026a7/FireCapture_v2.7.14.deb')
sha256sums_x86_64=('e0150c060dd32d5239ef7f47cebcbbec91dd0eef9d1db414cb22e1d97d7e4909')
source_aarch64=('https://github.com/devDucks/astroarch-pkgs/raw/c7ff89bcbab5d6601bfcf74004076f2593072d7e/packages/fire_capture/firecapture_2.7.14a_aarch64.deb')
sha256sums_aarch64=('576126579f4e747805c2a30068c595403da8634403c7c29af8b179e17c55fb87')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "$pkgdir/"
    chmod 755 "$pkgdir/opt"
    chmod 755 "$pkgdir/usr"
    chmod 755 "$pkgdir/usr/share"
    chmod 755 "$pkgdir/usr/share/applications"

    # License
    install -Dm644 "$pkgdir/opt/FireCapture_v2.7/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
