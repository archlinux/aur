# Maintainer: Misha <mishakmak@gmail.com>

pkgname=algorand-bin
pkgver=3.7.2
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
source=("https://github.com/algorand/go-algorand/releases/download/v3.7.2-stable/algorand-3.7.2-1.x86_64.rpm")
sha256sums=('930116911746abc10949da4479bfa23c965d2cd2408a4fddb783013e5d93fb06')

package(){
	cd "${srcdir}"

	install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"

	install -d "${pkgdir}/var/lib/algorand"
	cp -r var/lib/algorand/ "${pkgdir}/var/lib/"

    install -Dm644 lib/systemd/system/* -t "${pkgdir}/usr/lib/systemd/system/"
}
