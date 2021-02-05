# Maintainer: John Mark Gabriel Caguicla <jmg.caguicla@guarandoo.jp>

pkgname=mkinitcpio-ntpdsync
pkgver=1.0
pkgrel=1
pkgdesc="Synchronize time using ntpd"
arch=(any)
url=""
license=('GPL')
depends=(ntp)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=install
changelog=
source=("initrd-ntpdsync.service"
	"ntpdsync.hook"
	"ntpdsync.install"
	"LICENSE")
sha256sums=('64dc3e84c39a9cf597bb2c0f6520ec14c13b9b1a5d4093514dbc201572175ab9'
	    '05f7277db44fbdcb5c11e1b8196511a6a1bdeb27a728b3a67fcdf6770e864652'
	    'e93adb7327d57f5e2b6176e79eac9907da9fa8030782b6013c8190fe4db72c6a'
	    '01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b')
validpgpkeys=()


package() {
    install -Dm644 initrd-ntpdsync.service "$pkgdir/usr/lib/systemd/system/initrd-ntpsync.service"
    install -Dm644 ntpdsync.hook "$pkgdir/usr/lib/initcpio/hooks/ntpdsync"
    install -Dm644 ntpdsync.install "$pkgdir/usr/lib/initcpio/install/ntpdsync"
    install -Dm644 LICENSE "$pkgdir/usr/share/mkinitcpio-ntpdsync/LICENSE"
}
