# Maintainer: "strahe"

pkgname=binance
pkgver=0.0.2
pkgrel=1
pkgdesc="The Binance Desktop Application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('custom')
depends=()
optdepends=()
source=("https://ftp.binance.com/electron-desktop/linux/production/${pkgname}-amd64-linux.deb")
noextract=("${pkgname}-amd64-linux.deb")
sha256sums=('8a99544b0db91277522ebd6773db7005e8c7a3e1a3127c633b7cd9f5da37c84c')

package() {
    bsdtar -O -xf ${pkgname}-amd64-linux.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
