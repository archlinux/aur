# Maintainer: Hans Müller <schreibemirhalt@gmail.com>
pkgname=fakeaur
pkgver=V3
pkgrel=3
pkgdesc="Edit names and descriptions of AUR packages. Meme mates with nani or btwiusearch"
arch=('any')
url="https://github.com/schrmh/fakeAUR"
license=('unknown')
depends=('jq')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+https://github.com/schrmh/fakeAUR.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mv fakeAUR.sh "$pkgdir/usr/bin/fakeaur"
	chmod +x "$pkgdir/usr/bin/fakeaur"
}

