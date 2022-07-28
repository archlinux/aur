# Maintainer: Burak <burakberkkeskin@gmail.com>
pkgname=kubefwd-git
_pkgname=kubefwd
pkgver=1.22.3
pkgrel=1
pkgdesc="kubefwd is a command line utility built to port forward multiple services within one or more namespaces on one or more Kubernetes clusters."
arch=(x86_64)
url="https://github.com/txn2/kubefwd"
license=('MIT')
depends=(go)
makedepends=(git)
provides=(kubefwd)
conflicts=(kubefwd)
replaces=(kubefwd)
source=("git+$url")
md5sums=('SKIP')

build() {
  echo "Building Source Code"
	cd "$_pkgname"
	go build ./cmd/kubefwd/kubefwd.go
}

package() {
  echo "Installing binary to path"
	cd "$_pkgname"
	install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/kubefwd"
}
