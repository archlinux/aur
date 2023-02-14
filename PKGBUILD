# Maintainer: Kevin Schoon <me@kevinschoon.com>
pkgname=go-xmlstruct-git
provides=('go-xmlstruct-git')
conflicts=('go-xmlstruct')
pkgver=e7d40b8
pkgrel=1
pkgdesc="Generate Go structs from multiple XML documents."
arch=('x86_64' 'aarch64')
url='https://github.com/twpayne/go-xmlstruct'
license=('MIT')
depends=('go')
source=('git+https://github.com/twpayne/go-xmlstruct')
sha256sums=('SKIP')

pkgver() {
	cd go-xmlstruct
	git describe --always
}

build() {
	cd go-xmlstruct/cmd/goxmlstruct
	go build -o goxmlstruct
}

package() {
	install -D -m755 \
		go-xmlstruct/cmd/goxmlstruct/goxmlstruct ${pkgdir}/usr/bin/goxmlstruct
	install -D -m644 \
		go-xmlstruct/LICENSE ${pkgdir}/usr/share/licenses/go-xmlstruct/LICENSE
}
