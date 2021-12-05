# Maintainer Lucas Silva <lcdss[at]live[dot]com>

pkgname=waves-exchange
pkgver=1.0.0
pkgrel=2
pkgdesc="Waves.Exchange is an exchange that combines the advantages of centralized and decentralized digital trading approaches"
url="https://waves.exchange"
license=('MIT')
source=("https://waves.exchange/files/Waves.Exchange.deb")
arch=('x86_64')
md5sums=('1867cef5e7098d6bdcd98944f38938ff')
depends=()

package() {
    bsdtar -O -xf Waves.Exchange.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/Waves.Exchange/waves-exchange" "${pkgdir}/usr/bin/waves-exchange"
}
