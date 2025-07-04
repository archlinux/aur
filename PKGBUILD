#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
pkgname="hiero"
pkgver=5
pkgrel=3
pkgdesc="Bitmap Font Tool that saves in Angel Code font format"
arch=('any')
url="https://github.com/libgdx/libgdx/tree/master/extensions/gdx-tools/src/com/badlogic/gdx/tools/hiero"
license=('Apache')
depends=('jre8-openjdk' 'lwjgl2')
source=("runnable-${pkgname}.jar::https://libgdx-nightlies.s3.eu-central-1.amazonaws.com/libgdx-runnables/runnable-${pkgname}.jar")
noextract=("runnable-${pkgname}.jar")
sha256sums=('f3f7217accd4e4cb22c4f5d6b22ef6924152b5aaedfbdee84dcdcfeaaa054fe5')

prepare() {
	printf "#!/bin/sh\nexec /usr/lib/jvm/java-8-openjdk/jre/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar'\n" >${pkgname}.sh
}

package() {
	install -Dm644 runnable-${pkgname}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm644 ${pkgname}.sh $pkgdir/usr/bin/${pkgname}
	chmod +x $pkgdir/usr/bin/${pkgname}
}
