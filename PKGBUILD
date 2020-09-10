# Maintainer: "strahe"

pkgname=binance
pkgver=0.0.1
pkgrel=1
pkgdesc="The Binance Desktop Application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('custom')
depends=()
optdepends=()
source=("https://ftp.binance.com/electron-desktop/linux/production/${pkgname}-amd64-linux.deb")
noextract=("${pkgname}-amd64-linux.deb")
sha256sums=('15899857f25e7a5a5c59c4a8317538905cc12519875b201c8b4a2e1bbff2e4f5')

package() {
    bsdtar -O -xf ${pkgname}-amd64-linux.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
