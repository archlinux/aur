# Maintainer: Tyjak <dev@tyjak.net>
pkgname=binance-deb
_pkgname=binance
pkgver=1.13.1
pkgrel=1
pkgdesc="The Binance Desktop Application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
conflicts=('binance')
depends=()
optdepends=()
source=("https://ftp.binance.com/electron-desktop/linux/production/${_pkgname}-amd64-linux.deb")
sha256sums=('100a13f9e3d89ee7af28e20adc6f1cab33d32752326fb96ca7e177837cb7db82')

prepare() {
    cd $srcdir
    bsdtar -xJf data.tar.xz
}

package() {
    mv $srcdir/opt $pkgdir
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/Binance/binance $pkgdir/usr/bin/binance
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
