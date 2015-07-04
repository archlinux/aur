# Maintainer: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>

pkgname=cgd
pkgver=20130907
pkgrel=1
pkgdesc="A daemon that can serve a CGI script over HTTP or FastCGI."
arch=('any')
license=('MIT' 'CC0' 'Public Domain')
url="https://github.com/uriel/cgd"
makedepends=('go')
_gourl=github.com/uriel/cgd

build() {
	cd "$srcdir"
	GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

package() {
	cd "$srcdir"
	install -D bin/cgd $pkgdir/usr/bin/cgd
}
