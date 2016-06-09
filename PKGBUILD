# Maintainer Andreas Rammhold <andreas@rammhold.de>

pkgname=go3status
pkgver=0.23.0
pkgrel=1
pgdesc="Awesome i3bar tool"
arch=('x86_64' 'i686')
url='https://github.com/andir/go3status'
license=('GPLv3')
makedepends=('go')
options=('!strip')
_gourl="github.com/andir/go3status"

build() {
	GOPATH="${srcdir}" go get -v -x ${_gourl}
}


package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin/"
	install -m 655 "bin/go3status" "${pkgdir}/usr/bin/go3status"
}

