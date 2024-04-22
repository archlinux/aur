# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=pmrr
pkgver=1.0.1
pkgrel=2
pkgdesc="Poor man's reboot-required"
arch=('x86_64' 'armv7h')
url="https://github.com/Blutkoete/pmrr"
license=('GPL-3.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Blutkoete/pmrr/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b23365609cfeb3f5f2a20f7ed28348ac2c03004f45633a3d00c21fa8beaf2c8e')
backup=('etc/pmrr.conf')

prepare() {
    :
}

build() {
    :
}

package() {
    install -D -m755 -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}-${pkgver}/"pmrr-remove-reboot-required "${srcdir}/${pkgname}-${pkgver}/"pmrr-regenerate-hook
    install -D -m644 -t "${pkgdir}/etc/" "${srcdir}/${pkgname}-${pkgver}/"pmrr.conf
    install -D -m644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/${pkgname}-${pkgver}/"pmrr.hook
    install -D -m644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${pkgname}-${pkgver}/"pmrr-remove-reboot-required.service
}
