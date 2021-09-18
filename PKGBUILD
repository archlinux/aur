# Maintainer: Artemii Sudakov <finziyr@yandex.ru>

pkgname="rubin-git"
pkgver=1.2.r0.g1bfb442
pkgrel=1
pkgdesc='Translates English binaries to Russian'
arch=('any')
url="https://github.com/BiteDasher/rubin"
license=('MIT')
depends=('sh' 'sed')
makedepends=('git')
source=("${pkgname}::git+https://github.com/BiteDasher/rubin.git")
sha512sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
	cd "$srcdir/$pkgname"
	export pkgdir
	./install.sh makepkg
	install -Dm644 ./LICENSE "$pkgdir"/usr/share/licenses/rubin/LICENSE
}
