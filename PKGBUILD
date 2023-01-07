# Maintainer: Emma Tebibyte <emma@tebibyte.media>

_pkgbase=simexec
pkgname=simexec-git
pkgver=r179.a256b92
pkgrel=1
pkgdesc="Execute a program with the given argv"
arch=('any')
url="https://git.sr.ht/~trinity/src/tree/main/item/simexec/simexec.1"
license=('Unlicense')
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
	cd "src/$_pkgbase/"
	mkdir -p "$pkgdir/usr/bin/"
	cp "$_pkgbase" "$pkgdir/usr/bin/"
}
