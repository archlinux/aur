# Maintainer: Romain Gallet <rgallet@grumlimited.co.uk>
# Contributor: Romain Gallet <rgallet@grumlimited.co.uk>
_packager="Romain Gallet <rgallet@grumlimited.co.uk>"
_deb_pkgname=stacks-wallet.mainnet
pkgver=4.5.3
pkgname=stacks-wallet.mainnet-bin
pkgrel=1
pkgdesc='Stacks Wallet is everything you need to manage your tokens and collectibles and will protect your tokens when you use apps.'
arch=('x86_64')
url="https://github.com/blockstack/stacks-wallet"
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
source=("$url/releases/download/v$pkgver/stacks-wallet.mainnet.v$pkgver.deb")
md5sums=('758f33808a47671e404bb839dc9b85cc')
noextract=()

build() {
	rm control.tar.gz
	tar xvf data.tar.xz
}

package() {
	cp -fr usr/ ${pkgdir}
	cp -fr opt/ ${pkgdir}
	
	mkdir -p ${pkgdir}/usr/bin/
	
	ln -sf "/opt/Stacks Wallet/stacks-wallet" ${pkgdir}/usr/bin/stacks-wallet
}
