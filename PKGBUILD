# Maintainer: Juan Simón <play4pro at protonmail dot com>
#
pkgname=adguardhome-bin
_pkgname=AdGuardHome
pkgver=0.100.9
pkgrel=1
pkgdesc="Network-wide ads and trackers blocking DNS server (bin version)"
arch=('x86_64')
url="https://github.com/AdguardTeam/AdGuardHome"
license=('GPL')
source=("https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_amd64.tar.gz"
$_pkgname.service
)
install=$pkgname.install
sha256sums=('e1b28d38cc345de971a14a373025ea72da1145fe27199e2c94a9c7fab92d433b'
            '9f47d9b2d7daad4b4db08d7cf8c10a7fb55323f40e06161a56e6fcf109f890cd')

package() {
  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/var/lib/adguardhome/$_pkgname"
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}
