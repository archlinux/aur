# Maintainer: Joakim Hellsen (tlovinator@gmail.com)
# Contributor: Andrew Boktor andrew dot boktor at gmail dot com

pkgname=p4d
pkgver=2020.1
pkgrel=1
pkgdesc="Minimal Perforce Server"
arch=('x86_64')
url="https://www.perforce.com"
license=('custom:p4d')
depends=()
backup=('etc/p4d.conf')
install=p4d.install
source=(
        "http://ftp.perforce.com/perforce/r${pkgver:2:4}/bin.linux26${CARCH}/${pkgname}"{,.asc}
        p4d.service
        p4d.conf
       )
validpgpkeys=('E58131C0AEA7B082C6DC4C937123CB760FF18869')
sha256sums=('119849ee5f1ed48eb02aca83aca655c8bd51d8f7bc83c356dbd4aa0e93a984a0'
            'SKIP'
            'c648fc8b50eed66bea9a804a214011666c0cd5337ab238c93147d2692998b547'
            '25390ffb531f167a17aeac587d04a2401f8710c417db084e4b5a7f9afc4dd1d7')

package() {
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 p4d.service ${pkgdir}/usr/lib/systemd/system/p4d.service
    install -Dm644 p4d.conf ${pkgdir}/etc/p4d.conf
}
