# Maintainer: navigaid <navigaid@gmail.com>

pkgname=gopherjs
pkgver=1.13
pkgrel=1
arch=('any')
source=("git+https://github.com/gopherjs/gopherjs#branch=go1.13")
# makedepends=('go>=1.13' 'go<1.14')
makedepends=('go')
md5sums=('SKIP')

warn_build_references() {
    : # I like __FILE__ and don't consider build references to be a problem
}

build(){
	cd ${srcdir}/$pkgname
	[[ -f go.mod ]] || go mod init github.com/gopherjs/gopherjs
	go build .
}

package(){
	cd ${srcdir}/$pkgname
	install -Dm755 gopherjs ${pkgdir}/usr/bin/gopherjs
}
