# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=wasabi-wallet-bin
_pkgname=wasabi-wallet
pkgver=1.0.2
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
sha256sums=(
	"f8007eab95075e3ae6773cf5357a526770a823911b5b9b5a8bc6e104ea0880df"
	"74387afca4ebe33169f5d5eec41e7d58bac9bda92754344500edacf5490ec025"
)
# Run gpg --keyserver pool.sks-keyservers.net --recv-keys B4B72266C47E075E
validpgpkeys=('21D7CA45565DBCCEBE45115DB4B72266C47E075E')

package() {
	install -d -m755 "${pkgdir}/opt/"
	cp -a "$srcdir/WasabiLinux-${pkgver}" "${pkgdir}/opt/${_pkgname}"
	chown -R root:root "$pkgdir/opt/${_pkgname}"
	install -d -m755 "${pkgdir}/usr/bin/"
	ln -s "/opt/${_pkgname}/wassabee" "${pkgdir}/usr/bin/${_pkgname}"
}
