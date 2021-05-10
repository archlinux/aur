# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-bin'
pkgver=1.1.5
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
sha256sums_x86_64=('92c2a3eff148d6285c6f0816b932023fd321e2e659980aa6da819fbbe0630941')
sha256sums_aarch64=('0bd85e36d173adc6b08e10eeeb8eccc65f9821caca0a292157777a429bfc32e0')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
	rm -rf "$pkgdir/usr/share/doc"
	rm -rf "$pkgdir/usr/share/lintian"
	ln -s /usr/lib/chia-blockchain/resources/app.asar.unpacked/daemon/chia "$pkgdir/usr/bin/chia"
}
