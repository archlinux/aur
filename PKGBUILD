# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=RahulSandhu
_gitname=notse
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="TUI for taking notes inspired in clipse"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('make' 'go')
provides=("${_appname}")

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('be689555bbebb62203e171f51f5be59c91c9365e8f7667c0a79c6ccd77d1555b')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	make build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	install -Dm755 "build/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
