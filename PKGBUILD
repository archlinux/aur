# Maintainer: Clar Fon <them@lightdark.xyz>
pkgname=git-journal
pkgver=1.8.1
pkgrel=1
pkgdesc="The Git Commit Message and Changelog Generation Framework"
arch=('x86_64' 'i686')
url="https://github.com/saschagrunert/git-journal"
license=('MIT')
depends=()
makedepends=('cargo')
optdepends=()
provides=('git-journal')
conflicts=('git-journal')
source=("https://github.com/saschagrunert/git-journal/archive/$pkgver.tar.gz")
sha256sums=('1941a47668d024979eaeedc1c484b55be2786ff111d4189a6a2e50b29554394e')

build() {
	cd $pkgname-$pkgver
	cargo build --release
}

package() {
	cd $pkgname-$pkgver
	install -D -m755 "target/release/git-journal" "$pkgdir/usr/bin/git-journal"
	install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

