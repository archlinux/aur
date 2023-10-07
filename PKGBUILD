# Maintainer: Jens Nachtigall <aur.jens@nachtigall.email>
pkgname="maven39"
pkgver="3.9.5"
pkgrel=1
pkgdesc="Java project management and project comprehension tool (v3.9)"
arch=('any')
url="https://maven.apache.org"
license=('Apache')
depends=('java-environment>=8' 'bash' 'procps-ng')
makedepends=('java-environment>=8')
source=("$pkgname-$pkgver.tar.gz::https://dlcdn.apache.org/maven/maven-3/$pkgver/binaries/apache-maven-$pkgver-bin.tar.gz")
sha512sums=('4810523ba025104106567d8a15a8aa19db35068c8c8be19e30b219a1d7e83bcab96124bf86dc424b1cd3c5edba25d69ec0b31751c136f88975d15406cab3842b')

package() {
	install -dm755 "$pkgdir/opt"
	install -dm755 "$pkgdir/usr/bin"
	cp -R "$srcdir/apache-maven-$pkgver" "$pkgdir/opt/maven-3.9"
	ln -s "/opt/maven-3.9/bin/mvn" "$pkgdir/usr/bin/mvn39"
}
