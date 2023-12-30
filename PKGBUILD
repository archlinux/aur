# Maintainer: Jens Nachtigall <aur.jens@nachtigall.email>
pkgname="maven39"
pkgver="3.9.6"
pkgrel=1
pkgdesc="Java project management and project comprehension tool (v3.9)"
arch=('any')
url="https://maven.apache.org"
license=('Apache')
depends=('java-environment>=8' 'bash' 'procps-ng')
makedepends=('java-environment>=8')
source=("$pkgname-$pkgver.tar.gz::https://dlcdn.apache.org/maven/maven-3/$pkgver/binaries/apache-maven-$pkgver-bin.tar.gz")
sha512sums=('706f01b20dec0305a822ab614d51f32b07ee11d0218175e55450242e49d2156386483b506b3a4e8a03ac8611bae96395fd5eec15f50d3013d5deed6d1ee18224')

package() {
	install -dm755 "$pkgdir/opt"
	install -dm755 "$pkgdir/usr/bin"
	cp -R "$srcdir/apache-maven-$pkgver" "$pkgdir/opt/maven-3.9"
	ln -s "/opt/maven-3.9/bin/mvn" "$pkgdir/usr/bin/mvn39"
}
