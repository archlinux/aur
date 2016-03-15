# Maintainer: Egor Kovetskiy <e.kovetskiy@gmail.com>
pkgname=poe
pkgver=20160315.1_74131fa
pkgrel=1
pkgdesc="examine, list and fix suspicious constructs"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('go' 'git')

source=(
	"poe::git+ssh://github.com/kovetskiy/poe"
)

md5sums=(
	'SKIP'
)

backup=(
)

pkgver() {
	cd "$srcdir/$pkgname"

	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)

	echo "$date.${count}_$commit"
}

package() {
    install -DT "$srcdir/$pkgname/poe" "$pkgdir/usr/bin/poe"
}
