# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
_upstream_name=AdGuardHome
pkgver=0.107.66
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
sha256sums_armv7h=('8b6d7bcbbaa3a668858cbfdbeeecb37e95f07d6d54d19008e5785d5231d8812e')
sha256sums_aarch64=('73470a1d60944298d62d8cbb6c1b6b1d1623bf88f741905e797af148aec81d6c')
sha256sums_i686=('502a91c28a64a8e74a37ccc95f2a7526021c22f4e98aec80843f52096d04e461')
sha256sums_x86_64=('a88a748dd722ff5706f51a278d30c9f69f896cffd38e1653b84f85b145d967af')

package() {
    install -Dm755 "$_upstream_name/$_upstream_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -dm755 "$pkgdir/etc"
    ln -s /var/lib/$_name/$_upstream_name.yaml "$pkgdir/etc/$_name.yaml"
}
