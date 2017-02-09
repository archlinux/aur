# Maintainer: raa0121 <raa0121@gmail.com>
pkgname=kink-hg
_pkgname=kink
pkgver=0.1
pkgrel=1
pkgdesc="Kink is a prototype-based functional language on the JVM. The goal of the language is easy and elastic programming with handful number of simple mechanisms."
arch=('x86_64')
url="http://doc.kink-lang.org/kink/manual/index.html"
license=('MIT')
groups=('language')
depends=('jre8-openjdk')
makedepends=('apache-ant' 'mercurial')
install=
changelog=
source=("hg+https://bitbucket.org/kink/kink")
md5sums=(SKIP)

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	ant all
}

check() {
	cd "$_pkgname"
}

package() {
	cd "$_pkgname"
	install -Dm755 bin/kink $pkgdir/usr/bin/kink
	install -Dm644 lib/kink/kink.jar $pkgdir/usr/share/kink/lib/kink/kink.jar
	install -Dm644 lib/kink/third/always/asm-5.0.3.jar $pkgdir/usr/share/kink/lib/kink/third/always/asm-5.0.3.jar
	install -Dm644 lib/kink/third/always/asm-commons-5.0.3.jar $pkgdir/usr/share/kink/lib/kink/third/always/asm-commons-5.0.3.jar
	install -Dm644 lib/kink/third/always/slf4j-api-1.7.7.jar $pkgdir/usr/share/kink/lib/kink/third/always/slf4j-api-1.7.7.jar
	install -Dm644 lib/kink/third/notverbose/slf4j-nop-1.7.7.jar $pkgdir/usr/share/kink/lib/kink/third/notverbose/slf4j-nop-1.7.7.jar
	install -Dm644 lib/kink/third/verbose/slf4j-simple-1.7.7.jar $pkgdir/usr/share/kink/lib/kink/third/verbose/slf4j-simple-1.7.7.jar
}
