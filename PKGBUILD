# Maintainer: Milk Brewster (milk on freenode irc)
pkgname=chipdisco
pkgver=6.1
pkgrel=2
epoch=
pkgdesc="a dual-deck DJ app for tracker modules (.MOD/.XM/.S3M)"
arch=('any')
url="https://github.com/echolevel/chipdisco"
license=('unknown')
groups=()
depends=('java-runtime')
makedepends=('git' 'jdk-openjdk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/echolevel/chipdisco")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$srcdir/chipdisco"
	jar cf Chipdisco6.jar -C bin .
}

package() {
	cd "$srcdir/chipdisco"
	echo "#!/bin/sh" > chipdisco
	echo "exec /usr/bin/java -jar '/usr/share/java/chipdisco/Chipdisco6.jar' \"\$@\"" >> chipdisco
	install -D -m755 chipdisco "${pkgdir}/usr/bin/chipdisco"
	install -D -m644 Chipdisco6.jar "${pkgdir}/usr/share/java/chipdisco/Chipdisco6.jar"
	install -D -m644 core.jar "${pkgdir}/usr/share/java/chipdisco/core.jar"
}
