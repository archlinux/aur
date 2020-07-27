# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=ceb2txt
pkgver=0.1.0
pkgrel=1
pkgdesc='A small tool that can convert ceb (Conversations Encrypted Backup) files to simple plain text.'
arch=('any')
url="https://github.com/inputmice/ceb2txt"
license=('Apache')
depends=('java-runtime')
makedepends=('git' 'java-environment' 'maven')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz" 'ceb2txt')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mvn package
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 target/im.conversations.ceb2txt-0.1.jar $pkgdir/usr/share/java/$_pkgname/$_pkgname.jar

	cd "$srcdir"
	install -Dm755 ceb2txt $pkgdir/usr/bin/ceb2txt
}
md5sums=('b3aafbbd97d657d3806d392396aeba51'
         'f992aa1c4ff4190b639c8d54babb31d5')
