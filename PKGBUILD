# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-bin'
pkgver=2.7.5
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Binary Release, Provides GUI"
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
depends=('gtk3' 'libnotify' 'nss' 'libxtst' 'xdg-utils' 'python-atspi' 'libdrm' 'libxcb')
optdepends=('cuda: GPU plotting and harvesting')
conflicts=('chia' 'chia-gui')
provides=('chia' 'chia-gui')
options=('!strip')
source_x86_64=("https://github.com/Chia-Network/chia-blockchain/releases/download/${pkgver//_/-}/chia-blockchain_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://github.com/Chia-Network/chia-blockchain/releases/download/${pkgver//_/-}/chia-blockchain_${pkgver//_/-}_arm64.deb")
sha256sums_x86_64=('cb0f9ad5a8e921e1aaa3cd278a34496ee8134952e50a2383ac4b2c5811439db9')
sha256sums_aarch64=('ebf7a0afc25d6114412ac19a1c4e47b8b8c445f9b325658a3b027b140e6cde1e')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/chia/resources/app.asar.unpacked/daemon/chia "$pkgdir/usr/bin/chia"
	ln -s "/opt/chia/chia-blockchain" "$pkgdir/usr/bin/chiagui"
}
