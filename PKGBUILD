# Maintainer: Matt Mathis <aur@cloudninja.pw>
pkgname="jlibc"
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="glibc Bindings for Java"
arch=('x86_64')
url="https://bitbucket.org/Scoopta/jlibc/src/default/"
license=('GPL3')
groups=()
depends=('native-proxy' 'jdk-openjdk>=11')
makedepends=('mercurial')
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

prepare() {
	mkdir -p "${pkgname}-${pkgver}"
	hg clone ${url} "${pkgname}-${pkgver}"
}

build() {
	echo "Building"
	cd "${pkgname}-${pkgver}"
	./gradlew build
	cd ..
}

check() {
	echo "Checking"
}

package() {
	echo "Packaging"
	mkdir -p "../pkg/${pkgname}/usr/share/java"
	pwd
	cp ${pkgname}-${pkgver}/build/libs/*.jar "../pkg/${pkgname}/usr/share/java/"
}
