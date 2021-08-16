# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Leon Schumacher <youremail@domain.com>
pkgname=est
pkgver=1
pkgrel=1
pkgdesc="Easy signing tool (using ED25519)"
arch=('x86_64')
url="https://github.com/42LoCo42/est"
license=('GPL3')
makedepends=('zig')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6157a7604d6d75fe4126da23f0f21fa0a26b93af98392ebec3dfe8ba397f30dc')

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
