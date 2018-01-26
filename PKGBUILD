# Maintainer: Manuel Conzelmann <manuel.conzelmann at hs-furtwangen dot de>
pkgname=dongle-unlock
pkgver=1.1
pkgrel=1
pkgdesc="Automatically unlock encrypted devices with a thumbdrive-dongle or enter a passphrase to unlock them during boot with systemd. Conflicts probably with entries in /etc/crypttab"
arch=('any')
license=('GPL')
url=
install=dongle-unlock.install
license=('GPL')
depends=('cryptsetup' 'systemd')
source=('dongle-unlock.install' 'manolo.luksopenwithkey.service' 'manolo.luksopenwithoutkey.service' 'mnt-daten.mount' 'mnt-dongle.mount')
sha256sums=('28f945e0d986f9b5d3e3ba1485d3481c7f2f2ed1e775b67b3e20b501d7212cb0' '0df9ae0585ceb6174a8e1a7a4cc0fd1523d9127591689c49f89635c3d15e7374' 'fabc2b2a3624b9c30384ee709f03379bbbbff99a07ad166a077eadac20a750cc' 'e339d777ca20a3e8660573da4eed6d0b96b0305d96a9e419c56443f9441fb393' '3f90778a0eb8eb30226f11fba81c11f66b6c1164294c538a25e12b4a65a28624')
backup=('manolo.luksopenwithkey.service' 'manolo.luksopenwithoutkey.service' 'manolo.luksopenwithkey.service' 'mnt-daten.mount' 'mnt-dongle.mount')

package() {
    install -D -m644 $srcdir/manolo.luksopenwithkey.service $pkgdir/etc/systemd/system/manolo.luksopenwithkey.service || return 1
    install -D -m644 $srcdir/manolo.luksopenwithoutkey.service $pkgdir/etc/systemd/system/manolo.luksopenwithoutkey.service || return 1
    install -D -m644 $srcdir/mnt-dongle.mount $pkgdir/etc/systemd/system/mnt-dongle.mount || return 1
    install -D -m644 $srcdir/mnt-daten.mount $pkgdir/etc/systemd/system/mnt-daten.mount || return 1
}
