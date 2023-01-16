# Maintainer: grialion <grialion@grial.tech>
pkgname=rpcpp-git
pkgver=2.1.1
pkgrel=1
pkgdesc='Tool for Discord RPC to let your friends know about your Linux system'
arch=('any')
url='https://github.com/grialion/rpcpp'
license=('MIT')
depends=('wget' 'unzip' 'libx11')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sh setup.sh
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
