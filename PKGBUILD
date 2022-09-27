# Maintainer: Pierre Mavro <deimosfr@gmail.com>
pkgname=commitizen-go
pkgver=1.0.1
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
sha256sums=('4947a9ecd8f34a24f2760d8a4795f2d222ac4d063aa270ee70f8ace5684b07af')
