# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=ceb2txt
pkgver=0.2.1
pkgrel=0
pkgdesc='Small tool that can convert ceb files to simple plain text'
arch=('any')
url="https://github.com/inputmice/ceb2txt"
license=('Apache')
depends=('java-runtime' 'bash')
makedepends=('java-environment' 'maven')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz" 'ceb2txt')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mvn package
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 target/im.conversations.ceb2txt*.jar $pkgdir/usr/share/java/$_pkgname/$_pkgname.jar

	cd "$srcdir"
	install -Dm755 ceb2txt $pkgdir/usr/bin/ceb2txt
}
md5sums=('268ec57cb87661b5e3c30c180ac8bcbf'
         'f992aa1c4ff4190b639c8d54babb31d5')
