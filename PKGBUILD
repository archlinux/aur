pkgname=go-bin
pkgver=1.5rc1
pkgrel=1
provides=('go')
conflicts=('go')
pkgdesc='Compiler and tools for the Go programming language from Google'
arch=('x86_64' 'i686')
url='http://golang.org/'
license=('BSD')
makedepends=('git' 'go')
options=('!strip' 'staticlibs')

sha1sums_i686=('97ae55622479bbffaed893d72f699b32437acc8d')
sha1sums_x86_64=('2abf55effd93f5c2dcef306eaf14d3e7f614a407')

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
