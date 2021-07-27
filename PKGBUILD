# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-bin'
pkgver=1.2.3
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
sha256sums_x86_64=('9e5cc04dfd032184f334eedc813cc67594c4f5017766ebbef4c080d986afee9d')
sha256sums_aarch64=('f4c1b2d2999c26d2b77bbeb8564b67b67df53cf256859a774bb2f495ba7e9641')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
	rm -rf "$pkgdir/usr/share/doc"
	rm -rf "$pkgdir/usr/share/lintian"
	ln -s /usr/lib/chia-blockchain/resources/app.asar.unpacked/daemon/chia "$pkgdir/usr/bin/chia"
}
