# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>
pkgname=discord-moosic
pkgver=5.3
pkgrel=2
pkgdesc="Discord music bot"
arch=('any')
url="https://github.com/Repulser/Moosic"
license=('unknown')
depends=('java-runtime')
makedepends=('java-environment' 'gradle')
source=("https://github.com/Repulser/Moosic/archive/v$pkgver.tar.gz"
        "moosic.sh")
md5sums=('721de38c523592079f31ed6bfb5fe4af'
         '72da77119ac6de8549a9545369a4cbff')

build() {
	cd "$srcdir/Moosic-$pkgver"
	gradle shadowJar
}

package() {
	install -Dm755 "$srcdir/Moosic-$pkgver/build/libs/Moosic-$pkgver-all.jar" "$pkgdir/usr/share/java/moosic.jar"
	install -Dm755 "$srcdir/moosic.sh" "$pkgdir/usr/bin/$pkgname"
}
