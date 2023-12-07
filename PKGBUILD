# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=words-sv
pkgver=master
pkgrel=1
pkgdesc='A wordlist of swedish words for /usr/share/dict'
arch=(any)
url='https://github.com/almgru/svenska-ord.txt'
license=('Unlicense')
source=("${url}/archive/refs/heads/${pkgver}.tar.gz")
sha256sums=('098aa909f310192d91ded9edf1d65844ed984650721e9b3acb4758ccb382b4b2')

prepare() {
	cd "$srcdir"
	tar xf "${pkgver}.tar.gz"
}

package() {
	cd "$srcdir/svenska-ord.txt-${pkgver}"
	install -m644 -D -T svenska-ord.txt "${pkgdir}/usr/share/dict/swedish"
}
