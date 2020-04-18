# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=xurls
_name="${pkgname}"
pkgver=2.2.0
pkgrel=1
pkgdesc="Extract urls from plain text"
url="https://github.com/mvdan/${_name}"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('git' 'go')
source=("git+${url}#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
	cd "${srcdir}/${_name}"
	GO111MODULES=on go build -ldflags='-w -s' ./cmd/${_name}
}

package() {
	cd "${srcdir}/${_name}"
	install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
