# Maintainer: Pierre Mavro <deimosfr@gmail.com>
pkgname=commitizen-go
pkgver=1.0.3
pkgrel=1
pkgdesc="Command line utility to standardize git commit messages, golang version"
arch=(x86_64)
url="https://github.com/lintingzhen/commitizen-go"
license=('GPL')
makedepends=(git go)
source=("https://github.com/lintingzhen/commitizen-go/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
    make
}

package() {
    git_exec_path=$(git --exec-path)
	cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/$git_exec_path/git-cz"
}
sha256sums=('31dbcce99c7d73bfdb2d91571e640d05d98d66e10e9cc5e594decd9fd9d0d077')
