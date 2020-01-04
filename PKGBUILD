# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=hydroxide
pkgver=0.2.11
pkgrel=1
pkgdesc="A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
arch=('any')
_import="github.com/emersion/hydroxide"
url="https://$_import"
license=('mit')
makedepends=('go')
source=('go.sum')
sha512sums=('1d19564f04cb7e4ccf6dc92d6a717eb810051774bd6aba78c794b2a106fa79c01d25e75706944161683e32cbe1bb7c6fd9fcd421ee3f04600d537f58909ec303')

package() {
	echo -e "module build\n\ngo 1.13\n\nrequire $_import v$pkgver" > go.mod
	GO111MODULE=on go build -mod readonly -o $pkgdir/usr/bin/$pkgname $_import/cmd/$pkgname
}
