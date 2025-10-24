# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
_upstream_name=AdGuardHome
pkgver=0.107.68
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
sha256sums_armv7h=('52c9491f8d373952331929848e8f43950aac939899c14761ab060e515ae2ae1e')
sha256sums_aarch64=('2a49aea7db0c519d54d755ed1d4c5e96e8c6d5ef0c195308ed2925eeada75480')
sha256sums_i686=('090d93a5bba782fd1d5964d256545fceb70b7a33d1e49d71cc2f138f0e9554e4')
sha256sums_x86_64=('e0d9dd939425b236e9d9b4e78d8ec1fc3e5305292f7de86211bc5539c68854e5')

package() {
    install -Dm755 "$_upstream_name/$_upstream_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -dm755 "$pkgdir/etc"
    ln -s /var/lib/$_name/$_upstream_name.yaml "$pkgdir/etc/$_name.yaml"
}
