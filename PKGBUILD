# Maintainer: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>
pkgname=interrobang-git
_gitname="interrobang"
pkgver=0.41.467978d
pkgrel=1
pkgdesc="A tiny launcher menu packing a big bang (syntax)"
url="http://github.com/TrilbyWhite/interrobang.git"
arch=('any')
license=('GPL3')
depends=('libx11')
optdepends=('bash-completion: to use the default tab completion')
makedepends=('git')
source=("$_gitname::git://github.com/TrilbyWhite/interrobang.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_gitname"
	echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "${srcdir}/$_gitname"
	make
}

package() {
	cd "${srcdir}/$_gitname"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
