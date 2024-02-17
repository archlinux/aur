# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>
# Contributor: Jan-Jaap Korpershoek <jjkorpershoek96 at gmail dot com>

_ref=''
pkgname=kakoune-lsp-git
pkgver=v15.0.1+r39+g3ddff4e
pkgrel=1
pkgdesc='Kakoune Language Server Protocol Client'
arch=('x86_64')
url="https://github.com/kakoune-lsp/kakoune-lsp"
license=('custom:unlicense')
depends=('kakoune')
makedepends=('git' 'rust')
optdepends=() # Language servers
provides=("kak-lsp" "kakoune-lsp" "kak-lsp-git")
conflicts=("kak-lsp" "kakoune-lsp" "kak-lsp-git")
install="kakoune-lsp-git.install"
source=("${pkgname}::git+https://github.com/kakoune-lsp/kakoune-lsp${_ref}")
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

