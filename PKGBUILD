# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>
# Contributor: Byeonghoon Yoo <bh322yoo@gmail.com>

pkgname=adguardhome-binary
_pkgname=AdGuardHome
pkgver=0.107.78
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
sha256sums=('3eb76cc878f544bfc276929096c1d7d233e2e3d613886ee9a78b306ac3cd763e'
            'e9a50b7004218803ecf44c0be8c7fb28d584e8b7b3a821f26ff3478816ab0afd'
            '7cacae3dad7042f331208a47f7177a27b03a45984659df900ac175d715883aad')
sha256sums_i686=('a49d39195cebbee61de48804119ad3337ec8095783f9afd8447d13da9797fa4c')
sha256sums_x86_64=('2070f644644be8299232f4a7bff857036fb1423563c1bf8c787e07aaf4f88278')
sha256sums_arm=('c6f7548e424330a5f5b9e5f9c17d0f9445e38a870beb66db2538559909463a05')
sha256sums_armv6h=('b373d5057a0f8c33a2c90ff196277b18b415a5450c58ef55fbd7601443b76819')
sha256sums_armv7h=('948120085d25e7f95294e7ec38adc31cf2748e1c41003fb9b17d02f6082fb808')
sha256sums_aarch64=('71ef6d495d6d3fae45e6a80a172d44ae7f5aa528794cf927bb52fd5bff034eae')
source_i686=("$pkgname-$pkgver-i686.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_386.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_amd64.tar.gz")
source_arm=("$pkgname-$pkgver-arm.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_armv5.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_armv6.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_armv7.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/AdguardTeam/AdGuardHome/releases/download/v$pkgver/AdGuardHome_linux_arm64.tar.gz")

package() {
  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/var/lib/adguardhome/$_pkgname"
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$srcdir"/sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir"/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:

