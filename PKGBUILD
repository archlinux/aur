# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=java-repl
pkgver=428
pkgrel=1
epoch=
pkgdesc="Read Eval Print Loop for Java"
arch=(any)
url="https://github.com/albertlatacz/java-repl"
license=('Apache')
depends=('java-environment>=6')
provides=('java-repl')
conflicts=('java-repl-git')
options=('!strip')
source=("https://github.com/albertlatacz/$pkgname/releases/download/$pkgver/javarepl-$pkgver.jar"
	"javarepl.sh")
noextract=("javarepl-$pkgver.jar")

package() {
	mkdir -p "$pkgdir/usr/share/java/java-repl"
	mkdir -p "$pkgdir/usr/bin"

	install -Dm755 javarepl.sh "$pkgdir/usr/bin/javarepl"
	install -Dm644 "$srcdir/javarepl-$pkgver.jar" "$pkgdir/usr/share/java/java-repl/javarepl.jar"
}
md5sums=('0e0a40c803d98c41cff6966a90556aab'
         'e46a402b7e2b1ab9dc60f6f15175a95e')
