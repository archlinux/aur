pkgname=go-bin
pkgver=1.5beta3
pkgrel=1
provides=('go')
conflicts=('go')
pkgdesc='Compiler and tools for the Go programming language from Google'
arch=('x86_64' 'i686')
url='http://golang.org/'
license=('BSD')
makedepends=('git' 'go')
options=('!strip' 'staticlibs')

sha1sums_i686=('3ef27fb69ebb8157adec27fc3b0b8d78a5ee3cc9')
sha1sums_x86_64=('6a68ee1c8ade0470e1d56d6b66ba9ecd33bb3c1e')

source_i686=("https://storage.googleapis.com/golang/go${pkgver}.linux-386.tar.gz")
source_x86_64=("https://storage.googleapis.com/golang/go${pkgver}.linux-amd64.tar.gz")

package() {
	mkdir -p $pkgdir/usr/local
	tar -C $pkgdir/usr/local -xzf go${pkgver}.linux-*.tar.gz

	# bin
	mkdir -p $pkgdir/etc/profile.d
	cat > $pkgdir/etc/profile.d/go-bin.sh <<-'EOF'
	#!/bin/sh

	export PATH=$PATH:/usr/local/go/bin
	EOF
}
