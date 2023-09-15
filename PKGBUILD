# Maintainer: Jens Nachtigall <aur.jens@nachtigall.email>
pkgname="maven39"
pkgver="3.9.4"
pkgrel=1
pkgdesc="Java project management and project comprehension tool (v3.9)"
arch=('any')
url="https://maven.apache.org"
license=('Apache')
depends=('java-environment>=8' 'bash' 'procps-ng')
makedepends=('java-environment>=8')
source=("$pkgname-$pkgver.tar.gz::https://dlcdn.apache.org/maven/maven-3/$pkgver/binaries/apache-maven-$pkgver-bin.tar.gz")
sha512sums=('deaa39e16b2cf20f8cd7d232a1306344f04020e1f0fb28d35492606f647a60fe729cc40d3cba33e093a17aed41bd161fe1240556d0f1b80e773abd408686217e')

package() {
	install -dm755 "$pkgdir/opt"
	install -dm755 "$pkgdir/usr/bin"
	cp -R "$srcdir/apache-maven-$pkgver" "$pkgdir/opt/maven-3.9"
	ln -s "/opt/maven-3.9/bin/mvn" "$pkgdir/usr/bin/mvn39"
}
