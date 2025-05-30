# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=flopgen-git
pkgver=r48.72d28f7
pkgrel=1
pkgdesc="Tool for automatic creation of FAT-formatted floppy disk images "
arch=(x86_64)
url="https://github.com/maksgraczyk/Flopgen"
license=('GPLv3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('flopgen::git+https://github.com/maksgraczyk/Flopgen')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D flopgen "$pkgdir/usr/bin/flopgen"
}
