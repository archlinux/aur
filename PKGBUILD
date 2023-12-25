# Maintainer: Walter Smuts <smuts.walter@gmail.com>
# Forked from: Altmanninger <aclopte@gmail.com>

pkgname=git-autofixup-git
pkgdesc='A git subcommand to automatically create fixup commits for topic branches'
url='https://github.com/torbiak/git-autofixup'
license=('Artistic2.0')
pkgver=0.003001
pkgrel=2
depends=(perl git)
makedepends=(make)
optdepends=(
    'git-revise: efficiently apply fixup commits'
)
arch=(any)
source=(
	"git-autofixup::git+https://github.com/torbiak/git-autofixup.git#branch=master"
)
sha256sums=(SKIP)
conflicts=("git-autofixup")

build() {
	cd git-autofixup
	perl Makefile.PL
}

check() {
	cd git-autofixup
	make test
}

package() {
	cd git-autofixup
	make install DESTDIR="$pkgdir"
}
