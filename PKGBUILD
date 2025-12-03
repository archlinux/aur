# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
_upstream_name=AdGuardHome
pkgver=0.107.70
pkgrel=1
pkgdesc='Network-wide ads and trackers blocking DNS server'
arch=('armv7h' 'aarch64' 'i686' 'riscv64' 'x86_64')
url='https://github.com/AdguardTeam/AdGuardHome'
license=('GPL-3.0-only')
provides=("$_name")
conflicts=("$_name")
options=('!debug' '!strip')
source=("$_name.service")
source_armv7h=("$_upstream_name-${pkgver}_armv7h.tar.gz::$url/releases/download/v$pkgver/${_upstream_name}_linux_armv7.tar.gz")
source_aarch64=("$_upstream_name-${pkgver}_aarch64.tar.gz::$url/releases/download/v$pkgver/${_upstream_name}_linux_arm64.tar.gz")
source_i686=("$_upstream_name-${pkgver}_i686.tar.gz::$url/releases/download/v$pkgver/${_upstream_name}_linux_386.tar.gz")
source_riscv64=("$_upstream_name-${pkgver}_riscv64::$url/releases/download/v$pkgver/${_upstream_name}_linux_riscv64.tar.gz")
source_x86_64=("$_upstream_name-${pkgver}_x86_64::$url/releases/download/v$pkgver/${_upstream_name}_linux_amd64.tar.gz")
sha256sums=('cd50ab7fa526078e30b8a3d0ff504cbf0aad713818ad922d99236b0a246ae204')
sha256sums_armv7h=('e9cde2634a2d939cb6ab6a10e53877517aa5f6f5baaa49e6daf5a5be8202ca98')
sha256sums_aarch64=('c6adddce2a1b9de55064b305d6499c466c8cba16a7e8010e009232e016038f1d')
sha256sums_i686=('fc50b159a6d4f239b31154a6e2a7dd31e5e6f042ea6473d9bc53f62279c8b898')
sha256sums_riscv64=('53fb4e2a8c1515303d6a0af5bfb8a1279b59f54caa94196162fb2905173ad4ca')
sha256sums_x86_64=('5bacf3957e153dd8202e25861064ba264f1a1c203db532381ea6c0f4f05ca992')

package() {
    install -Dm755 "$_upstream_name/$_upstream_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -dm755 "$pkgdir/etc"
    ln -s /var/lib/$_name/$_upstream_name.yaml "$pkgdir/etc/$_name.yaml"
}
