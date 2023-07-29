# Maintainer: Romain Gallet <rgallet@grumlimited.co.uk>
# Contributor: Romain Gallet <rgallet@grumlimited.co.uk>
_packager="Romain Gallet <rgallet@grumlimited.co.uk>"
_deb_pkgname=stacks-wallet.mainnet
pkgver=4.10.1
pkgname=stacks-wallet.mainnet-bin
pkgrel=3
pkgdesc='Stacks Wallet is everything you need to manage your tokens and collectibles and will protect your tokens when you use apps.'
arch=('x86_64')
url="https://github.com/hirosystems/stacks-wallet"
license=('MIT')
groups=()
depends=('gtk3' 'libappindicator-gtk3' 'libsecret' 'nss' 'nodejs')
makedepends=()
checkdepends=()
optdepends=()
provides=()
replaces=()
backup=()
options=()
install=stacks-wallet.mainnet-bin.install
source=("$url/releases/download/v$pkgver/stacks-wallet.mainnet.v$pkgver.deb" "file://stacks-wallet.desktop")
md5sums=('8eb341be0f6c2189c3fbb2740276d57d' 'a3b1f26d804c0af1b055a1c491c9bcb3')
noextract=()

build() {
	rm control.tar.gz
	tar xvf data.tar.xz
}

package() {
	cp -fr usr/ ${pkgdir}
	cp -fr opt/ ${pkgdir}
	
	mkdir -p ${pkgdir}/usr/bin/

    cp stacks-wallet.desktop ${pkgdir}/usr/share/applications/
	
	ln -sf "/opt/Hiro Wallet/stacks-wallet" ${pkgdir}/usr/bin/stacks-wallet
}
