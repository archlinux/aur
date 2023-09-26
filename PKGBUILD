# Maintainer: Romain Gallet <romain.gallet at gmail.com>
# Contributor: Romain Gallet <romain.gallet at gmail.com>
_packager="Romain Gallet <romain.gallet at gmail.com>"
_deb_pkgname=leather-wallet.mainnet
pkgver=4.14.1
pkgname=leather-wallet.mainnet-bin
pkgrel=1
pkgdesc='Leather Wallet is everything you need to manage your tokens and collectibles and will protect your tokens when you use apps.'
arch=('x86_64')
url="https://github.com/hirosystems/stacks-wallet"
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
source=("$url/releases/download/v$pkgver/leather-wallet.mainnet.v$pkgver.deb" "file://leather-wallet.desktop")
md5sums=('3c30529f8152de17dd56bca41a27688c' 'a3b1f26d804c0af1b055a1c491c9bcb3')
noextract=()

build() {
	rm control.tar.gz
	tar xvf data.tar.xz
}

package() {
	cp -fr usr/ ${pkgdir}
	cp -fr opt/ ${pkgdir}
	
	mkdir -p ${pkgdir}/usr/bin/

    	cp leather-wallet.desktop ${pkgdir}/usr/share/applications/
	
	ln -sf "/opt/Leather/leather-wallet" ${pkgdir}/usr/bin/leather-wallet
}
