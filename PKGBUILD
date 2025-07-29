# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
_upstream_name=AdGuardHome
pkgver=0.107.64
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
sha256sums_armv7h=('2d8fe35ce32c812d63058365306504a00aaa9322abbe629a5c8e95242c123dc6')
sha256sums_aarch64=('0861421e48b34c3b3e19a046e993de242a4e1445085a60eceb086bed01fbb28e')
sha256sums_i686=('d48bed59cf899b2bfaaff264b0adb3817d4d75dfbc89d5cfa85c110711c6f573')
sha256sums_x86_64=('1f4626a56c8295874bd2ba49a3bab4f8edafc91a2da85361e68b46dc712e33d3')

package() {
    install -Dm755 "$_upstream_name/$_upstream_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -dm755 "$pkgdir/etc"
    ln -s /var/lib/$_name/$_upstream_name.yaml "$pkgdir/etc/$_name.yaml"
}
