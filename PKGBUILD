# Maintainer: Egor Kovetskiy <e.kovetskiy@gmail.com>
pkgname=shdoc-git
_pkgname=shdoc
pkgver=20200713.38_02f326e
pkgrel=1
pkgdesc="generate documentation for shell scripts"
arch=('any')
license=('MIT')
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
