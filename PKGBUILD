# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nguyen Hong Hiep <ahifdifo@domain.com>
pkgname=hello-world
_pkgname=helloworld
pkgver=1.0
pkgrel=1
pkgdesc="Just a test package, will be removed soon"
arch=('x86_64')
url="https://github.com/justanoobcoder/helloworld"
license=('custom')
depends=('cowsay')
makedepends=('gcc')
conflicts=('helloworld')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('ecf892d8840e3d62ed21670ce9e2ba7e')

build() {
	cd "$_pkgname-$pkgver"
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
