# Maintainer: Oto Šťáva <oto.stava@gmail.com>
_pkgname=autoedit

pkgname=${_pkgname}-git
pkgver=r1.af46184
pkgrel=1
pkgdesc="A script for interactive editing of GNU Autotools project configurations"
arch=('any')
url="https://gitlab.com/Spiffyk/autoedit"
license=('MIT')
depends=('autoconf' 'bash' 'grep')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.com/Spiffyk/autoedit.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
	mkdir -p "$pkgdir/usr/bin"
	cp autoedit.sh "$pkgdir/usr/bin/autoedit"
}
