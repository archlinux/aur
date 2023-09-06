# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Misha <mishakmak@gmail.com>

pkgname=algorand-bin
pkgver=3.17.0
pkgrel=1
pkgdesc="Implementation of the Algorand protocol and node software"
arch=('x86_64')
url="https://www.algorand.com"
license=('AGPL3')
backup=('var/lib/algorand/genesis.json' 'var/lib/algorand/system.json')
depends=("systemd")
provides=("algorand")
conflicts=("algorand")
install=algorand-bin.install
source=("https://github.com/algorand/go-algorand/releases/download/v${pkgver}-stable/algorand-${pkgver}-1.x86_64.rpm")
sha384sums=('7dcceebfe396cc957159bdc8814f5c4bf60a6d666a6090ebdd4105f2dece0388d40ec6ec45f5655c8ed8e78447b96500')

package(){
	cd "${srcdir}"

	install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"

	install -d "${pkgdir}/var/lib/algorand"
	cp -r var/lib/algorand/ "${pkgdir}/var/lib/"

    install -Dm644 lib/systemd/system/* -t "${pkgdir}/usr/lib/systemd/system/"
}
