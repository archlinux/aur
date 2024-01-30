# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=apg-c
_pkgname=${pkgname%-c}-7.0
pkgver=7.0
_commit=6212ba997f954d6688fe29afd352892682cfff3e
pkgrel=1
pkgdesc='an ABNF parser generator creating recursive-descent parsers from a superset of ABNF'
arch=(x86_64)
url="https://github.com/ldthomas/$_pkgname"
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(cmake)
conflicts=(apg)
_archive="$_pkgname-$_commit"
source=("$url/archive/$_commit/$_archive.tar.gz")
sha256sums=('2ba58fca1873fed98fee47828ec13fd6fe1f5b5305b90c2a15437e21be8a15a3')

build() {
	cd "$_archive"
	./build.sh -r apg
}

package() {
	cd "$_archive"
	install -Dm0755 Release/apg/apg70 "$pkgdir/usr/bin/apg-c"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
