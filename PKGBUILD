# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
_upstream_name=AdGuardHome
pkgver=0.107.71
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
sha256sums_armv7h=('901457506f571505836aa9767daef56d5fe750c50ee900ae4449b32dc43a9b0d')
sha256sums_aarch64=('f5ea04e043994f63a1f2d240805398abeda877046db0cf943b976872562dfc3e')
sha256sums_i686=('abbed72a497c27f06b456466bcbcd0c66809e42bbb4f2db26176b5aad547efc2')
sha256sums_riscv64=('5ebfdac14a8035c0cc4da8ab399c22cb2200b32a7b3dcca7ac2a508666d9352e')
sha256sums_x86_64=('b4b01a5da971a67bc2458ba0fc075de1b356cf6a37843e900177f329777cc5db')

package() {
    install -Dm755 "$_upstream_name/$_upstream_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -dm755 "$pkgdir/etc"
    ln -s /var/lib/$_name/$_upstream_name.yaml "$pkgdir/etc/$_name.yaml"
}
