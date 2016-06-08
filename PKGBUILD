# Maintainer: Will Marshall <wcm64@case.edu> 
# Past Maintainer: Matthias Riegler <riegler.matthias2@gmail.com>
pkgname=openspin-git
pkgver=r42.fe4797b
pkgrel=1
pkgdesc="Open Source SPIN interpreter for the ParallaxⓇ Propeller. Git Version"
arch=('x86_64' 'i686')
url="https://github.com/parallaxinc/OpenSpin"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('openspin::git+https://github.com/parallaxinc/OpenSpin')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm 755 build/openspin "${pkgdir}/usr/bin/openspin" 
}
