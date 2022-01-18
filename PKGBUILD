# Maintainer: Misha <mishakmak@gmail.com>

pkgname=algorand-bin
pkgver=3.2.3
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
source=("http://algorand-dev-deb-repo.s3-website-us-east-1.amazonaws.com/releases/stable/f9e2a447d_3.2.3/algorand-3.2.3-1.x86_64.rpm")
sha256sums=('d00f8943ae30c0fe032aafe7b925529e27cfc978b1f37cb72fb6dec06da545b0')

package(){
	cd "${srcdir}"

	install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"

	install -d "${pkgdir}/var/lib/algorand"
	cp -r var/lib/algorand/ "${pkgdir}/var/lib/"

    install -Dm644 lib/systemd/system/* -t "${pkgdir}/usr/lib/systemd/system/"
}
