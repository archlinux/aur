# Package p4d
# Maintainer: Andrew Boktor andrew dot boktor at gmail dot com
pkgname=p4d
pkgver=2014.2.1033284
pkgrel=1
pkgdesc="Perforce Server"
arch=('x86_64')
url="http://www.perforce.com"
license=('custom:p4d')
depends=()
backup=('etc/p4d.conf')
install=p4d.install
source=(
        http://www.perforce.com/downloads/perforce/r${pkgver:2:4}/bin.linux26${CARCH}/${pkgname}
        p4d.service
        p4d.conf
       )

sha1sums=('92f2f2847b32c0669c1a187dbfe4fc48de3c8b90'
          '8033b7c40f9ff96578f220bf0c27e51788eec661'
          '85ebc96e2c678020308de6985d9e5e53aedbf49c')

package() {
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 p4d.service ${pkgdir}/usr/lib/systemd/system/p4d.service
    install -Dm644 p4d.conf ${pkgdir}/etc/p4d.conf
}
