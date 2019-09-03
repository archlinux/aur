# Maintainer: Jérémie Astor <astor.jeremie@wanadoo.fr>
pkgname=gwion
pkgver=0.1
pkgrel=1
pkgdesc="a strongly timed musical programming language"
arch=('any')
url="https://github.com/fennecdjay/gwion"
license=('GPL3')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/fennecdjay/gwion')
md5sums=('SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"
  git clone https://github.com/fennecdjay/gwion-util util
  git clone https://github.com/fennecdjay/gwion-ast ast
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="" DESTDIR="$pkgdir/" install
}
