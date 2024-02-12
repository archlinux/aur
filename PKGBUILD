# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn-bin
pkgver=90000.0.0
pkgrel=1
pkgdesc="A terminal-based chat client for MatterMost"
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn')
conflicts=('matterhorn')
depends=('gmp' 'ncurses5-compat-libs' 'zlib')
source=("https://github.com/matterhorn-chat/matterhorn/releases/download/${pkgver}/matterhorn-${pkgver}-ubuntu-22.04-jammy-$CARCH.tar.bz2"
	"LICENSE::https://raw.githubusercontent.com/matterhorn-chat/matterhorn/master/LICENSE")
sha1sums=('edf0e5e0a53d41ccc1ab4aa11076684a8da763a1'
	'41bd788816973ea1340759da722bac169d6dc746')

package() {
	install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	cd ${srcdir}/matterhorn-${pkgver}-ubuntu-22.04-jammy-${arch}
	install -m755 -D matterhorn ${pkgdir}/usr/bin/matterhorn
}
