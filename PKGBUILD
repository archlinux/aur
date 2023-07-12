# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
VCS=git
pkgname=git-assembler-${VCS}
pkgver=v1.5.r1.a304409
pkgrel=1
pkgdesc="git-assembler can perform automatic merge and rebase operations following a simple declarative script. Like “make”, for branches."
arch=(any)
url="https://www.thregr.org/~wavexx/software/git-assembler"
license=('GPL3')
groups=()
depends=(python)
makedepends=("${VCS}")
provides=("${pkgname%-${VCS}}")
conflicts=("${pkgname%-${VCS}}")
replaces=()
backup=()
options=()
install=
source=("git-assembler::${VCS}+https://gitlab.com/wavexx/git-assembler.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-${VCS}}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	:
}

build() {
	:
}

check() {
	:
}

package() {
	cd "$srcdir/${pkgname%-${VCS}}"
	install -D ./git-assembler "$pkgdir/usr/bin/git-assembler"
}
