# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-bin'
pkgver=2.5.1_rc2
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
sha256sums_x86_64=('6702e28a14bb7d384c18b0ee0b53b278828da82d2d69958f9c200b4aa2f198a6')
sha256sums_aarch64=('dc918a37aab06cd73833dbe5bfba7999dc51277309e959b2d4a9d9a9829f3bf0')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/chia/resources/app.asar.unpacked/daemon/chia "$pkgdir/usr/bin/chia"
	ln -s "/opt/chia/chia-blockchain" "$pkgdir/usr/bin/chiagui"
}
