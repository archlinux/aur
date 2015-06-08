# Contributor: graysky <graysky AT archlinux dot us>
pkgname=checkip
pkgver=3.08
pkgrel=1
pkgdesc='Simple script that checks to see if your external IP address changed and if so sends an email with the new IP address.'
arch=('any')
url=('https://github.com/graysky2/checkip')
license=('MIT')
depends=('curl' 'dnsutils' 'inetutils')
optdepends=(
	'mailsend: simple program to send mail via SMTP protocol'
	's-nail: mail processing system with a command syntax reminiscent of ed'
	'heirloom-mailx: commandline utility for sending and receiving email')

source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('c358fccc6391567bdbe134e5e37fcaba5012bdf056b149a36127db72c31f67e4')
install=readme.install

build () {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
