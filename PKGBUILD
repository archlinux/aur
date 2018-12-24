# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname="jgtk+"
pkgver=1.0
pkgrel=1
srcdir="src"
epoch=
pkgdesc="GTK+ 3 Bindings for Java"
arch=('x86_64')
url="https://bitbucket.org/Scoopta/jlibc/src/default/"
license=('GPL3')
groups=()
depends=('native-proxy' 'jdk-openjdk>=11')
makedepends=('mercurial')
source=("${pkgname}::hg+$url")
sha256sums=('SKIP')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
validpgpkeys=()

pkgver() {
	mkdir -p ${srcdir}/${pkgname}
	cd ${srcdir}/${pkgname}
        echo $(hg identify -i)
}

build() {
	cd ${pkgname}
	./gradlew build 
	cd ..
}

check() {
	echo "Checking"
}

package() {
	echo "Packaging"
	mkdir -p "../pkg/${pkgname}/usr/share/java"
	cp ${pkgname}/build/libs/*.jar "../pkg/${pkgname}/usr/share/java/"
}
