# Maintainer: Egor Kovetskiy <e.kovetskiy@gmail.com>
pkgname=shdoc-git
_pkgname=shdoc
pkgver=1.0.0
pkgrel=1
pkgdesc="generate documentation for shell scripts"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('gawk')
url="https://github.com/reconquest/shdoc"
source=(
	"$pkgname::git+ssh://github.com/reconquest/shdoc"
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
    install -DT "$srcdir/$pkgname/shdoc" "$pkgdir/usr/bin/shdoc"
}
