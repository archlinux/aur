# Maintainer: Per Osbeck <per@osbeck.com>
pkgname=perfops-cli
pkgver=0.8.2
pkgrel=1
pkgdesc="A simple command line tool to interact with hundreds of servers around the world. Run benchmarks and debug your infrastructure without leaving your console."
arch=(x86_64)
url="https://perfops.net"
license=('APACHE')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/ProspectOne/$pkgname.git#tag=v$pkgver")
sha256sums=(SKIP)

build() {
	cd "$pkgname"
	GOPATH="$srcdir" PERFOPS_BUILD_PLATFORMS=linux go get -u github.com/ProspectOne/perfops-cli
}

package() {
	install -Dm755 "bin/perfops-cli" "$pkgdir/usr/bin/perfops-cli"
}
