# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
_upstream_name=AdGuardHome
pkgver=0.107.67
pkgrel=1
pkgdesc='Network-wide ads and trackers blocking DNS server'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/AdguardTeam/AdGuardHome'
license=('GPL-3.0-only')
provides=("$_name")
conflicts=("$_name")
options=(!debug)
source=("$_name.service")
source_armv7h=("$url/releases/download/v$pkgver/${_upstream_name}_linux_armv7.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/${_upstream_name}_linux_arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/${_upstream_name}_linux_386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/${_upstream_name}_linux_amd64.tar.gz")
sha256sums=('b472fa61b2251758403c4b6662d46b5b5b686b094d290a90acbaa93e19ec7640')
sha256sums_armv7h=('9daf97873fcd0ac479e8e610d6fc13256e7d4480f8332020b0c5056665577766')
sha256sums_aarch64=('564263ad884e020009b6175914f1de993e13c47ae6f45fa591e7bb9d29d6dea5')
sha256sums_i686=('e580cde47b3ca0684014437f588c01f5813f17e644bab0b4a9e8983e326523d3')
sha256sums_x86_64=('0413be8bc00d1b04ff29f33f47e7915e65424620ffa7644c146b7424809bf875')

package() {
    install -Dm755 "$_upstream_name/$_upstream_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -dm755 "$pkgdir/etc"
    ln -s /var/lib/$_name/$_upstream_name.yaml "$pkgdir/etc/$_name.yaml"
}
