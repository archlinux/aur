pkgname=turbo-spork
pkgdesc="A simple RTS game"
pkgrel=1
pkgver=0.2
arch=('any')
url="https://github.com/fictional-pancake/$pkgname"
depends=("java-runtime")
makedepends=("apache-ant")
source=(
	"$url/archive/v$pkgver.zip"
)
md5sums=(
	"7afc54eed37e71bea7acca98c6ec9a26"
)
package () {
	mkdir -p $pkgdir/usr/share/java/turbo-spork
	mkdir -p $pkgdir/usr/bin
	echo -e "#!/bin/bash\njava -jar /usr/share/java/turbo-spork/turbo-spork.jar $@" > $pkgdir/usr/bin/turbo-spork
	chmod 755 $pkgdir/usr/bin/turbo-spork
	cd $srcdir/$pkgname-$pkgver
	ant jar
	install -Dm755 build/dist/turbo-spork.jar $pkgdir/usr/share/java/turbo-spork
}
