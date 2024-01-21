# Maintainer: Romain Gallet <romain.gallet at gmail.com>
# Contributor: Romain Gallet <romain.gallet at gmail.com>
_packager="Romain Gallet <romain.gallet at gmail.com>"
_deb_pkgname=leather-wallet.mainnet
pkgver=4.14.3
pkgname=leather-wallet.mainnet-bin
pkgrel=4
pkgdesc='Leather Wallet is everything you need to manage your tokens and collectibles and will protect your tokens when you use apps.'
arch=('x86_64')
url="https://github.com/leather-wallet/desktop"
license=('MIT')
groups=()
depends=('gtk3' 'libappindicator-gtk3' 'libsecret' 'nss' 'nodejs')
makedepends=()
checkdepends=()
optdepends=()
provides=()
replaces=('stacks-wallet.mainnet-bin')
conflicts=('stacks-wallet.mainnet-bin')
backup=()
options=()
install=leather-wallet.mainnet-bin.install
source=("$url/releases/download/v$pkgver/leather-wallet.mainnet.v$pkgver.deb" "file://leather-wallet.desktop" "file://leather-192x192.png")
md5sums=('ce09f61a0550cadaa20c115f4d2c7a9c' '21908631b19a511f720f502b75985a4d' 'cf9746b967c79915938547c77f280a38')
noextract=()

build() {
	rm control.tar.gz
	tar xvf data.tar.xz
}

package() {
	cp -fr usr/ ${pkgdir}
	cp -fr opt/ ${pkgdir}
	
	mkdir -p ${pkgdir}/usr/bin/ ${pkgdir}/usr/share/icons/hicolor/192x192/apps/

    	cp leather-wallet.desktop ${pkgdir}/usr/share/applications/
	cp leather-192x192.png ${pkgdir}/usr/share/icons/hicolor/192x192/apps/leather.png
	
	ln -sf "/opt/Leather/leather-wallet" ${pkgdir}/usr/bin/leather-wallet
}
