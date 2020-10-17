# FLA.SH

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=fla.sh-git
_pkgname=${pkgname%-*}
pkgver=1.2.r8.gbf17b7d
pkgrel=1
pkgdesc='Flashcards in your terminal.'
arch=('any')
url='https://github.com/tallguyjenks/fla.sh'
license=('MIT')
provides=('flash')
conflicts=('flash')
depends=('bash' 'fzf' 'bat')
source=("git+https://github.com/tallguyjenks/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 flash "$pkgdir/usr/bin/flash"
}

