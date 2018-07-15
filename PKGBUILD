# Maintainer: Sávio Costa <saviocmc at protonmail dot com>
pkgname=wakeup-triggers
pkgver=0.2.3
pkgrel=1
pkgdesc='Let the user set the wakeup triggers of system suspension'
arch=('any')
url=https://gitlab.com/saviocmc/wakeup-triggers
license=(MIT)
depends=(systemd)
source=(wakeup-triggers.sh wakeup-triggers.conf wakeup-triggers.service)
sha512sums=(
    '9166fc3b572764bb79005a3738805005d133165c9bfd03a04bcd98199805564d87cec3de85e858aeafa31ffc11baefdd4e37587e000613688c41a4ebdc7e591a'
    'aed7df02adcf97ff8c62060f6c9f1f3a6772e2f320b294de22f8d7f4c83a8f52318936c6b58a022fa2b6bbf85339f9becaa9992083c6a80aed04f9baa925a0bb'
    '4fbb0021c6bee226474e7901413acb3495d120d8f3cf0b068ea8bed25470c61a8f73d62b9c63c734e752f6d36c87ae817ff58286cf16dd0c64c2cd3fb5709872'
)
backup=('etc/wakeup-triggers.conf')

package() {
    mkdir -p $pkgdir/usr/bin
    install -Dm755 wakeup-triggers.sh $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/lib/systemd/system
    install -Dm644 wakeup-triggers.service $pkgdir/usr/lib/systemd/system/
    mkdir -p $pkgdir/etc
    install -Dm644 wakeup-triggers.conf $pkgdir/etc
}