# Maintainer: Laura Demkowicz-Duffy

pkgname=pascal-fc
pkgver=1
pkgrel=1
epoch=
pkgdesc="An implementation of pascal with extra constructs for teaching concurrent programming"
arch=('x86_64')
url="https://github.com/danieljabailey/Pascal-FC"
license=('GPL')
depends=('fpc' 'git')
makedepends=('fpc')
source=('pascal-fc::git+git://github.com/danieljabailey/Pascal-FC')
noextract=()
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make pfccomp
	make pint
}

package() {
	cd "$pkgname"
	install -D pfccomp $pkgdir/usr/bin/pfccomp
	install -D pint $pkgdir/usr/bin/pint
}
