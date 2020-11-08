
pkgbase=mpd_cdrom
pkgname=mpd_cdrom
pkgver=1.0.0
pkgrel=1
url=https://github.com/ochurlaud/mpd_cdrom

pkgdesc="Add songs to mpd when a CD-ROM is inserted, remove them when ejected"
license=('MIT')
arch=('any')
depends=('mpd' 'mpc' 'cdparanoia')

source=("${pkgname}-${pkgver}::https://github.com/ochurlaud/mpd_cdrom/archive/v1.0.0.tar.gz")
md5sums=('d81275c1948c5fd3359bad89a17fc745')

install=${pkgname}.install

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/etc/udev/rules.d/"
    mkdir -p "${pkgdir}/etc/systemd/system/"
    cp src/bin/* "${pkgdir}/usr/bin/"
    cp src/systemd/* "${pkgdir}/etc/systemd/system/"
    cp src/udev-rules/* "${pkgdir}/etc/udev/rules.d/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
