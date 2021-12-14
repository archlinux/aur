#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
pkgname="hiero"
pkgver=5
pkgrel=1
pkgdesc="Bitmap Font Tool that saves in Angel Code font format"
arch=('any')
url="https://github.com/libgdx/libgdx/wiki/Hiero"
license=('Apache')
depends=('jre8-openjdk')
source=("runnable-${pkgname}.jar::https://libgdx.badlogicgames.com/ci/nightlies/runnables/runnable-${pkgname}.jar")
noextract=("runnable-${pkgname}.jar")
sha256sums=('7607bdb3a2ff68f7082f079211a86dab5c09c5daa64fa473ba0d6a30361afcc1')

prepare() {
	printf "#\!/bin/sh\nexec /usr/lib/jvm/java-8-openjdk/jre/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar'" > ${pkgname}.sh
}

package() {
	install -Dm644 runnable-${pkgname}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm644 ${pkgname}.sh $pkgdir/usr/bin/${pkgname}
	chmod +x $pkgdir/usr/bin/${pkgname}
}
