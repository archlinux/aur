# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-bin'
pkgver=2.5.2
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
sha256sums_x86_64=('5b194465d81313f7d2fd50a140a9abf456b9d8e60e32ec12f42768bd19c74938')
sha256sums_aarch64=('34636b3e17e870030fa682d1c9347367e100e75bd2b86e351dd72ed9623bcc06')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/chia/resources/app.asar.unpacked/daemon/chia "$pkgdir/usr/bin/chia"
	ln -s "/opt/chia/chia-blockchain" "$pkgdir/usr/bin/chiagui"
}
