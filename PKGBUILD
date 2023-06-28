# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-bin'
pkgver=1.8.2
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Binary Release, Provides GUI"
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
depends=('gtk3' 'libnotify' 'nss' 'libxtst' 'xdg-utils' 'python-atspi' 'libdrm' 'libxcb')
conflicts=('chia' 'chia-gui')
provides=('chia' 'chia-gui')
options=('!strip')
source_x86_64=("https://github.com/Chia-Network/chia-blockchain/releases/download/$pkgver/chia-blockchain_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/Chia-Network/chia-blockchain/releases/download/$pkgver/chia-blockchain_${pkgver}_arm64.deb")
sha256sums_x86_64=('654815dfc68dfa89fc9f79de16a1675bd477ec682ff994bf8fc065cdbc760786')
sha256sums_aarch64=('d6ea3c7ed95905a8d098282c8860dd98c0228ebc66cd92dc6c69d0f66066ad86')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/chia/resources/app.asar.unpacked/daemon/chia "$pkgdir/usr/bin/chia"
	ln -s "/opt/chia/@chiagui" "$pkgdir/usr/bin/chiagui"
}
