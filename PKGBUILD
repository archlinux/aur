# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=pillager
pkgver=0.8.0
_commit=b7ed81a0fc4dd771dff5a7f9e3b7bf16be50213f
pkgrel=1
pkgdesc='Pillage filesystems for sensitive information with Go'
arch=(x86_64)
url=https://github.com/brittonhayes/pillager
license=(MIT)
makedepends=(git go)
source=("git+$url.git#commit=$_commit")
md5sums=(SKIP)

prepare() {
	cd "$pkgname"
	go mod download
	go mod tidy
}

build() {
	cd "$pkgname"
	go build -v -o bin/pillager cmd/pillager/main.go
}

package() {
	cd "$pkgname"
	install -Dm755 bin/pillager -t "$pkgdir/usr/bin"
}
