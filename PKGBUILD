# shellcheck disable=2034
# Maintainer: Andres Rodriguez Michel <andresmichelrodriguez@gmail.com>
pkgname=git-prompt
pkgver=1.0.1
pkgrel=1
pkgdesc="Displays a compact color-coded git status, git branch, and more inside your shell prompt"
arch=(any)
url="https://github.com/Dosx001/GitPrompt"
makedepends=(cmake make)
source=("https://github.com/Dosx001/GitPrompt/archive/refs/tags/$pkgver.tar.gz")
md5sums=("749601a353c9bfc6b270a4b17c4d3a97")

build() {
	cd "GitPrompt-$pkgver"
	cmake CMakeLists.txt
	make
}

package() {
	cd "GitPrompt-$pkgver"
	install -Dm755 bin/$pkgname "${pkgdir}/usr/bin/$pkgname"
}
