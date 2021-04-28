# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>
_pkgname=ki-shell
pkgname=ki-shell-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Kotlin Language Interactive Shell"
arch=('any')
url='https://github.com/Kotlin/kotlin-interactive-shell'
license=('Apache')
depends=('bash' 'java-runtime>=8')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://repo1.maven.org/maven2/org/jetbrains/kotlinx/$_pkgname/$pkgver/$_pkgname-$pkgver-archive.zip")
md5sums=('3644c712f0ad0a1e3453f2507be39e1c')

build() {
	cd "ki"
	cat << EOF > ki
#!/bin/sh
java -jar /usr/lib/${_pkgname}/${_pkgname}.jar
EOF
}

package() {
	cd "ki"
	install -Dm644 "lib/${_pkgname}.jar" -t "${pkgdir}/usr/lib/${_pkgname}"
	install -Dm755 "ki" -t "${pkgdir}/usr/bin"
}
