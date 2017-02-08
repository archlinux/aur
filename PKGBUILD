# Contributor: Jonathan Wiersma <archaur at jonw dot org>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=eclipse-antlr4-runtime
pkgver=4.5.2
pkgrel=1
pkgdesc="Support for antlr parser generator in Eclipse"
arch=('i686' 'x86_64')
url="https://github.com/boothen/Json-Eclipse-Plugin"
license=('BSD')
depends=("eclipse")
noextract=(
	org.antlr.v4_4.5.2.jar
	org.antlr.antlr4-runtime-osgi_4.5.2.1.jar
	org.antlr.antlr4-runtime-osgi.source_4.5.2.1.jar
)
source=(
	"http://boothen.github.io/Json-Eclipse-Plugin/features/org.antlr.v4_4.5.2.jar"
        "http://boothen.github.io/Json-Eclipse-Plugin/plugins/org.antlr.antlr4-runtime-osgi_4.5.2.1.jar"
        "http://boothen.github.io/Json-Eclipse-Plugin/plugins/org.antlr.antlr4-runtime-osgi.source_4.5.2.1.jar"
)
md5sums=(
	'58d3f0a6bf3e8d709bbff19416fe37e3'
	'8116b492724169f01a9417f75721221f'
	'4e12a9a6ebc172027ed4e0a2f1205f16'
)

package() {
    install -d "$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/features"
    install -m644 "$srcdir/org.antlr.v4_4.5.2.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/features"

    install -d "$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
    install -m644 "$srcdir/org.antlr.antlr4-runtime-osgi_4.5.2.1.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
    install -m644 "$srcdir/org.antlr.antlr4-runtime-osgi.source_4.5.2.1.jar" \
    	"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins"
}
