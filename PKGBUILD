# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Misha <mishakmak@gmail.com>

pkgname=algorand-bin
pkgver=3.15.1
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
sha384sums=('bf6adce32761140a78b8b815c72272048f641de6fa17d7bf930f4691eb2b51aa25e3a0565a848be3cc2e407275b190c9')

package(){
	cd "${srcdir}"

	install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"

	install -d "${pkgdir}/var/lib/algorand"
	cp -r var/lib/algorand/ "${pkgdir}/var/lib/"

    install -Dm644 lib/systemd/system/* -t "${pkgdir}/usr/lib/systemd/system/"
}
