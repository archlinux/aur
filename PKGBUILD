# Maintainer: Victor Engmark <victor.engmark@gmail.com>
pkgname=fgit
pkgver=1.0.2
pkgrel=1
pkgdesc="Run git commands on multiple repositories with a single command"
arch=('any')
url='https://github.com/l0b0/fgit'
license=('GPL3')
depends=('bash' 'git' 'ncurses')
makedepends=('make')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/l0b0/fgit/archive/${pkgver}.tar.gz")
sha512sums=('83cbbe918f6b2a154c107b7350ffd900f33a0e1021e62bd90cb7d8ef1b4e6773115c90de3c9677996fc8e877da3b92a0cdd75cc8c492fbcdb41fe15d02cde718')

prepare() {
    mv "$srcdir/${pkgname}-${pkgver}" "$srcdir/${pkgname}"
}

check() {
	cd "$srcdir/${pkgname}"
	make test
}

package() {
	cd "$srcdir/${pkgname}"
	make PREFIX="${pkgdir}/usr" DESTDIR="/usr" install
}
