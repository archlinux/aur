
pkgbase="mpd_cdrom"
pkgname="mpd_cdrom"
pkgver="1.0.0"
pkgrel=1

pkg_desc="Add songs to mpd when a CD-ROM is inserted, remove them when ejected"
license=('MIT')
arch=('any')
depends=('mpd' 'mpc' 'cdparanoia')

source=("${pkgname}-${pkgver}::git+https://github.com/ochurlaud/mpd_cdrom.git")
md5sums=('SKIP')

install=${pkgname}.install

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/etc/udev/rules.d/"
    mkdir -p "${pkgdir}/etc/systemd/system/"
    cp src/bin/* "${pkgdir}/usr/bin/"
    cp src/systemd/* "${pkgdir}/etc/systemd/system/"
    cp src/udev-rules/* "${pkgdir}/etc/udev/rules.d/"
}
