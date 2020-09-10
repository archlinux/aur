# Maintainer: raa0121 <raa0121@gmail.com>
pkgname=kink-hg
_pkgname=kink
pkgver=0.1
pkgrel=2
pkgdesc="Kink is a prototype-based functional language on the JVM. The goal of the language is easy and elastic programming with handful number of simple mechanisms."
arch=('x86_64')
url="http://doc.kink-lang.org/"
license=('MIT')
groups=('language')
depends=('jre11-openjdk')
makedepends=('mercurial')
install=
changelog=
source=("hg+https://hg.osdn.net/view/kink/kink")
md5sums=(SKIP)

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	./gradlew installDist
}

check() {
	cd "$_pkgname"
}

package() {
	cd "$_pkgname"
	install -Dm755 build/install/kink/bin/kink $pkgdir/usr/bin/kink
	install -Dm644 build/install/kink/lib/kink-0.0.1-SNAPSHOT.jar $pkgdir/usr/share/kink/lib/kink/kink-0.0.1-SNAPSHOT.jar
	install -Dm644 build/install/kink/lib/slf4j-api-1.8.0-beta2.jar $pkgdir/usr/share/kink/lib/kink/slf4j-api-1.8.0-beta2.jar
}
