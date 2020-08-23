# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>
# Contributor: Byeonghoon Yoo <bh322yoo@gmail.com>

pkgname=adguardhome-binary
_pkgname=AdGuardHome
pkgver=0.103.3
pkgrel=1
pkgdesc="Network-wide ads & trackers blocking DNS server. (Binary version)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/AdguardTeam/AdGuardHome"
license=('GPL3')
provides=("adguardhome=$pkgver")
conflicts=('adguardhome')
install=${pkgname}.install
source=(
  "$_pkgname.service"
  sysusers.conf
  tmpfiles.conf
)
md5sums=(
  'c871693f1652bb013c1f017ba4742bb2'
  '23068358e1b9884e9a09fe95338cd809'
  '674d0b655bb5e7e0347169e7a40a5cfb'
)
source_i686=("$pkgname-$pkgver.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_386.tar.gz")
md5sums_i686=('0585bd80cf047f9a1353385eed3d717a')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_386.tar.gz")
md5sums_x86_64=('bb6152c5ad1849c8281698e61ba62e2e')
source_arm=("$pkgname-$pkgver.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_armv5.tar.gz")
md5sums_arm=('31c30057a07ef5e94b3bc2c1a6fd0d81')
source_armv6h=("$pkgname-$pkgver.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_armv6.tar.gz")
md5sums_armv6h=('bac96fd24935b1d4884c3e811094ce1d')
source_armv7h=("$pkgname-$pkgver.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_armv7.tar.gz")
md5sums_armv7h=('617e9863911b35ff117c4f10ba9ab7d3')
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_arm64.tar.gz")
md5sums_aarch64=('dcc905eec65ea807cd08a8c29c90205c')

package() {
  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/var/lib/adguardhome/$_pkgname"
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$srcdir"/sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir"/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:

