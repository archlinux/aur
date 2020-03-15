# Maintainer: Antonio Napolitano <nap at antonionapolitano dot eu>
pkgname=sincon-git
pkgver=1.1
pkgrel=1
pkgdesc="Semplice wrapper script che permette di ottenere sinonimi e contrari di una parola da www.sinonimi-contrari.it"
arch=('any')
url="https://git.antonionapolitano.eu/zAxny32/sincon"
license=('GPL')
depends=('python' 'python-beautifulsoup4')
makedepends=('git')
provides=("sincon")
conflicts=("sincon")
source=('sincon-git::git+https://git.antonionapolitano.eu/zAxny32/sincon')
md5sums=('SKIP')

pkgver() {
	echo "$srcdir/sincon-git" 1>&2
	cd "$srcdir/sincon-git"
	git describe --tag
}

package() {
	cd "$srcdir/sincon-git"
	install -Dm755 sincon.py $pkgdir/usr/bin/sincon
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
