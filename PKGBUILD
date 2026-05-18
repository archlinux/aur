# Maintainer: IotaBread <iotabread at gmail dot com>
pkgname=vineflower
pkgver=1.12.0
pkgrel=1
pkgdesc="Modern Java & JVM language decompiler focused on output quality & readability"
arch=('any')
url="https://vineflower.org"
license=('Apache-2.0')
depends=('java-runtime>=17' 'sh')
replaces=('quiltflower')
source=("https://repo1.maven.org/maven2/org/vineflower/vineflower/$pkgver/$pkgname-$pkgver.jar"
        "https://repo1.maven.org/maven2/org/vineflower/vineflower/$pkgver/$pkgname-$pkgver.jar.asc")
noextract=("$pkgname-$pkgver.jar")
sha256sums=('1dfcfe974395734fa467ce620661c7623d05ba83670de0529b1fbd63ff548b9d'
            'SKIP')
validpgpkeys=('0EBCB16A237726FFB2892E7AA5B7381AF8CBB702')

package() {
	install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -d "$pkgdir/usr/bin"
	printf '#!/usr/bin/sh\nexec java -jar /usr/share/java/%s/%s "$@"\n' "$pkgname" "$pkgname.jar" > $pkgdir/usr/bin/$pkgname
	chmod 755 "$pkgdir/usr/bin/$pkgname"
}
