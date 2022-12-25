# shellcheck disable=2034
# Maintainer: Andres Rodriguez Michel <andresmichelrodriguez@gmail.com>
pkgname=git-prompt
pkgver=1.0.0
pkgrel=2
pkgdesc="Displays a compact color-coded git status, git branch, and more inside your shell prompt"
arch=(any)
url="https://github.com/Dosx001/GitPrompt"
makedepends=(cmake make)
source=("https://github.com/Dosx001/GitPrompt/archive/refs/tags/$pkgver.tar.gz")
md5sums=("52b6ef43dcdf4136bc47fd50359c0987")

build() {
	cd "GitPrompt-$pkgver"
	cmake CMakeLists.txt
	make
}

package() {
	cd "GitPrompt-$pkgver"
	install -Dm755 bin/GitPrompt "${pkgdir}/usr/bin/$pkgname"
}
