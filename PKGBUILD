# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Misha <mishakmak@gmail.com>

pkgname=algorand-bin
pkgver=3.16.3
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
sha384sums=('590e72c0948d36fe9a4124ed0fe02a26f5048231acd28095dbd8c7a91d9e8966ed33e82499d0d2b501d00e7c492e8c07')

package(){
	cd "${srcdir}"

	install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"

	install -d "${pkgdir}/var/lib/algorand"
	cp -r var/lib/algorand/ "${pkgdir}/var/lib/"

    install -Dm644 lib/systemd/system/* -t "${pkgdir}/usr/lib/systemd/system/"
}
