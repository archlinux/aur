# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=doggo-git
_pkgname=doggo
pkgver=r38.99e53d5
pkgrel=1
pkgdesc="Command-line DNS Client for Humans. Written in Golang" 
arch=('x86_64')
url="https://github.com/mr-karan/doggo"
license=('GPL3')
makedepends=('git' 'go')
provides=('doggo')
conflicts=('doggo')
options=()
source=(git+https://github.com/mr-karan/doggo.git)
md5sums=('SKIP')
build() {
	cd "$srcdir"/"$_pkgname"
	make
}

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/"$_pkgname"
	mkdir -p "$pkgdir"/usr/bin/
	install -Dm755 "bin/$_pkgname" "$pkgdir"/usr/bin/
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname2}/LICENSE"
}
