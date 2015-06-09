# $Id$
# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=pastecat
pkgver=0.3.0
pkgrel=2
pkgdesc="Minimalist self-hosted pastebin service"
url="https://github.com/mvdan/pastecat"
license=('BSD')
arch=('i686' 'x86_64')
depends=()
makedepends=('git' 'go' 'godep')
options=('!strip')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	godep go build
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
