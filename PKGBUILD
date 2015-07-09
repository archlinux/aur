#submitter: perlawk

pkgname=chicken-coops
_pkgname=coops
pkgver=1.93
pkgrel=1
pkgdesc="An featureful object system"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/coops"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-record-variants')
install=

build() {
	cd "$srcdir"
	if [ ! -e "$_pkgname" ]; then
		chicken-install -r "$_pkgname:$pkgver"
	fi
}

package() {
	cd "$srcdir/$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
