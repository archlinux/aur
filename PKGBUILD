# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>
pkgname=discord-moosic
pkgver=5.3
pkgrel=1
pkgdesc="Discord music bot"
arch=('any')
url="https://github.com/Repulser/Moosic"
license=('unknown')
depends=('java-runtime')
makedepends=('java-environment' 'gradle')
source=("https://github.com/Repulser/Moosic/archive/v$pkgver.tar.gz"
        "moosic.sh")
md5sums=('721de38c523592079f31ed6bfb5fe4af'
         '6db6f39b7cf2ed59573d6b0c65bb47a3')

build() {
	cd "$srcdir/Moosic-$pkgver"
	gradle shadowJar
}

package() {
	install -Dm755 "$srcdir/Moosic-$pkgver/build/libs/Moosic-$pkgver-all.jar" "$pkgdir/usr/share/java/moosic.jar"
	install -Dm755 "$srcdir/moosic.sh" "$pkgdir/usr/bin/$pkgname"
}
