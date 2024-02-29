# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-bin'
pkgver=2.2.0
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
source_x86_64=("https://github.com/Chia-Network/chia-blockchain/releases/download/$pkgver/chia-blockchain_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/Chia-Network/chia-blockchain/releases/download/$pkgver/chia-blockchain_${pkgver}_arm64.deb")
sha256sums_x86_64=('f107c0cfa89fbf1024170f19ceb0879aef73bf24e11eb78ff9d663a52f34195c')
sha256sums_aarch64=('6f188cfdc7291e1f268e5ec1ad9cc363d304528322ae2af52340db1d0ffd1f4b')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
	rm -rf "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/chia/resources/app.asar.unpacked/daemon/chia "$pkgdir/usr/bin/chia"
	ln -s "/opt/chia/@chiagui" "$pkgdir/usr/bin/chiagui"
}
