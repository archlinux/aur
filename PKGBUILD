# Maintainer: Emma Tebibyte <emma@tebibyte.media>

_pkgbase=simexec
pkgname=simexec-git
pkgver=r181.c00d19e
pkgrel=2
pkgdesc="Execute a program with the given argv"
arch=('any')
url="https://git.sr.ht/~trinity/src/tree/main/item/simexec/packaging.md"
license=('Unlicense')
makedepends=('sysexits')
provides=('simexec')
source=("git+https://git.sr.ht/~trinity/src")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/src/$_pkgbase/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/src/$_pkgbase/"
	make
}

package() {
	cd "$srcdir/src/$_pkgbase/"
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/man/man1/"
	cp "$_pkgbase" "$pkgdir/usr/bin/"
	cp "$_pkgbase.1" "$pkgdir/usr/share/man/man1/"
}
