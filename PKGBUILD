pkgname=turbo-spork
pkgdesc="A simple RTS game"
pkgrel=1
pkgver=0.3
arch=('any')
url="https://github.com/fictional-pancake/$pkgname"
depends=("java-runtime")
makedepends=("apache-ant")
source=(
	"$url/archive/v$pkgver.zip"
)
md5sums=(
	"ae565e32304978281ea841142469db75"
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
