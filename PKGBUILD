# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>
# Contributor: Jan-Jaap Korpershoek <jjkorpershoek96 at gmail dot com>

_ref=''
pkgname=kak-lsp-git
pkgver=v14.2.0+r28+g7c8c71a
pkgrel=1
pkgdesc='Kakoune Language Server Protocol Client'
arch=('x86_64')
url="https://github.com/kak-lsp/kak-lsp"
license=('custom:unlicense')
depends=('kakoune')
makedepends=('git' 'rust')
optdepends=() # Language servers
provides=("kak-lsp")
conflicts=("kak-lsp")
install="kak-lsp-git.install"
source=("${pkgname}::git+https://github.com/kak-lsp/kak-lsp${_ref}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
	cd "${srcdir}/${pkgname}"
	make build
}

package() {
	cd "${srcdir}/${pkgname}"
	make install DESTDIR=${pkgdir}
}

