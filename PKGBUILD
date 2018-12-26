# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=wasabi-wallet-bin
_pkgname=wasabi-wallet
pkgver=1.0.5
pkgrel=1
pkgdesc="Privacy focused, ZeroLink compliant Bitcoin wallet"
arch=('x86_64')
options=(!strip staticlibs)
url="https://wasabiwallet.io/"
license=('MIT')
provides=('wasabi-wallet')
conflicts=('wasabi-wallet')
source=(
	"https://github.com/zkSNACKs/WalletWasabi/releases/download/v${pkgver}/WasabiLinux-${pkgver}.tar.gz"
	"https://github.com/zkSNACKs/WalletWasabi/releases/download/v${pkgver}/WasabiLinux-${pkgver}.tar.gz.asc"
)
sha256sums=('c1d3ef22541a4565a9cc790daa90e550041d767cb9771abaea6399bb9a5d2f0c'
            'SKIP')
# Run gpg --keyserver pool.sks-keyservers.net --recv-keys B4B72266C47E075E
validpgpkeys=('21D7CA45565DBCCEBE45115DB4B72266C47E075E')

package() {
	install -d -m755 "${pkgdir}/opt/"
	cp -a "$srcdir/WasabiLinux-${pkgver}" "${pkgdir}/opt/${_pkgname}"
	chown -R root:root "$pkgdir/opt/${_pkgname}"
	install -d -m755 "${pkgdir}/usr/bin/"
	ln -s "/opt/${_pkgname}/wassabee" "${pkgdir}/usr/bin/${_pkgname}"
}
