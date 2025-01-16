# Maintainer: Romain Gallet <gr211 at users.noreply.github.com>
# Contributor: Romain Gallet <gr211 at users.noreply.github.com>
_packager="Romain Gallet <gr211 at users.noreply.github.com>"
_deb_pkgname=leather-wallet.mainnet
pkgver=4.15.1
pkgname=leather-wallet.mainnet-bin
pkgrel=1
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
md5sums=('829dac876864f8ed641f306054af3f35'
         '21908631b19a511f720f502b75985a4d'
         'cf9746b967c79915938547c77f280a38')
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
