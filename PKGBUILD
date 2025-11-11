# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
_upstream_name=AdGuardHome
pkgver=0.107.69
pkgrel=2
pkgdesc='Network-wide ads and trackers blocking DNS server'
arch=('armv7h' 'aarch64' 'i686' 'riscv64' 'x86_64')
url='https://github.com/AdguardTeam/AdGuardHome'
license=('GPL-3.0-only')
provides=("$_name")
conflicts=("$_name")
options=('!debug' '!strip')
source=("$_name.service")
source_armv7h=("$url/releases/download/v$pkgver/${_upstream_name}_linux_armv7.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/${_upstream_name}_linux_arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/${_upstream_name}_linux_386.tar.gz")
source_riscv64=("$url/releases/download/v$pkgver/${_upstream_name}_linux_riscv64.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/${_upstream_name}_linux_amd64.tar.gz")
sha256sums=('b472fa61b2251758403c4b6662d46b5b5b686b094d290a90acbaa93e19ec7640')
sha256sums_armv7h=('38c1914641eb954d4f9af99128d3e425b2d29eac163183fee5f63a74029d916f')
sha256sums_aarch64=('34298af99fda196ddbc617da01bc9d8b5ca3fc7636717d786c5a96f6b4dfa0ae')
sha256sums_i686=('9846d676fe8af9a75293f72710f4d825e7847162dc44e617e1ef3b4b5f6a8f0e')
sha256sums_riscv64=('daf432f3468a0382c86c1291a83c8138c52dcf7002a8238442843ba4ec88d36e')
sha256sums_x86_64=('36d82638a30d436d18db3e6f8aaeabe8d5f684e0d451127b8d18d5553a3e5325')

package() {
    install -Dm755 "$_upstream_name/$_upstream_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
    install -dm755 "$pkgdir/etc"
    ln -s /var/lib/$_name/$_upstream_name.yaml "$pkgdir/etc/$_name.yaml"
}
