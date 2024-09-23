# Maintainer: thorko contact@thorko.de
pkgname=ripe-atlas-probe
pkgver=5080
pkgrel=0
pkgdesc="Ripe atlas probe"
arch=('x86_64')
url='https://ftp.ripe.net/ripe/atlas/software-probe/centos7/noarch/'
license=('AGPL-3.0-only')
makedepends=('git' 'go' 'make')
source=("${pkgname}::https://ftp.ripe.net/ripe/atlas/software-probe/centos7/x86_64/atlasswprobe-5080-1.el7.x86_64.rpm")
sha256sums=('SKIP')

package() {
    install -Dm0644 "${srcdir}/usr/lib/systemd/system/atlas.service" "${pkgdir}/usr/lib/systemd/system/atlas.service"
    install -dm755 "${srcdir}/usr/local/atlas/lib" "${pkgdir}/usr/local/lib"
    cp -a ${srcdir}/usr/local/atlas/lib/* ${pkgdir}/usr/local/lib/
    install -dm755 "${srcdir}/usr/local/atlas/etc" "${pkgdir}/etc/atlas"
    cp -a ${srcdir}/usr/local/atlas/etc/* ${pkgdir}/etc/atlas
    install -dm755 "${srcdir}/usr/local/atlas/bin" "${pkgdir}/usr/local/bin"
    cp -a ${srcdir}/usr/local/atlas/bin/* ${pkgdir}/usr/local/bin/
}
