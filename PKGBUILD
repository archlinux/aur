# Maintainer: Tobias Frisch <thejackimonster@gmail.com>
pkgname=tabula-java
_name=tabula
pkgver=1.0.5
pkgrel=2
pkgdesc="Extract tables from PDF files"
arch=('any')
url="https://tabula.technology"
license=('MIT')
depends=('java-runtime')
provides=('tabula')
conflicts=('tabula')
source=(
	"https://github.com/tabulapdf/$pkgname/releases/download/v$pkgver/$_name-$pkgver-jar-with-dependencies.jar"
    "run.sh"
)
md5sums=('b9fef34faaf8629499474b7d201cd04a'
         'b89123d631d17d8e8eba3f10cdb5d230')

package() {
    mkdir -p "$pkgdir/usr/share/java/$_name" "$pkgdir/usr/bin"
    install -D -m644 "$srcdir/$_name-$pkgver-jar-with-dependencies.jar" "$pkgdir/usr/share/java/$_name/$_name.jar"
    install -D -m755 "$srcdir/run.sh" "$pkgdir/usr/bin/$_name"
}
