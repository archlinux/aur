# Package p4d
# Maintainer: Andrew Boktor andrew dot boktor at gmail dot com
pkgname=p4d
pkgver=2016.1
pkgrel=1
pkgdesc="Minimal Perforce Server"
arch=('x86_64')
url="http://www.perforce.com"
license=('custom:p4d')
depends=()
backup=('etc/p4d.conf')
install=p4d.install
source=(
        ftp://ftp.perforce.com/perforce/r${pkgver:2:4}/bin.linux26${CARCH}/${pkgname}
        p4d.service
        p4d.conf
       )

sha256sums=('7fecb1b4711f7dfd13cd85e973d74cbfcab81ff5b567116d96bd70abe2c58097'
            'c648fc8b50eed66bea9a804a214011666c0cd5337ab238c93147d2692998b547'
            '25390ffb531f167a17aeac587d04a2401f8710c417db084e4b5a7f9afc4dd1d7')

package() {
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 p4d.service ${pkgdir}/usr/lib/systemd/system/p4d.service
    install -Dm644 p4d.conf ${pkgdir}/etc/p4d.conf
}
