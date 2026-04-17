# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mrkatebzadeh
_pkgname=animestan
pkgname=${_pkgname}-bin
pkgdesc="Terminal weapon to search, watch, and keep track of animes"

pkgver=0.1.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}"{,-cli})
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('b9787b219081450ef78f489fa6bdf5374b1fcf5fbcf9cb4b3100626edfb99ff9')
sha256sums_x86_64=('a56c8b11ce1a71db682bb15ce9d0bc5e9def67a8db38498c9451c7f9199521e8')
sha256sums_aarch64=('3f0bbb930493639d773118e623e64b8b382ad4c6a90a5bd24c7131237cba8989')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${_pkgname}-cli" "${pkgdir}/usr/bin/${_pkgname}-cli"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
