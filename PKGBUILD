# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mrkatebzadeh
_pkgname=animestan
pkgname=${_pkgname}-bin
pkgdesc="Terminal weapon to search, watch, and keep track of animes"

pkgver=0.1.5
pkgrel=4
_pkgvername=v${pkgver}-rc.${pkgrel}

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
sha256sums=('bb99bc9b8073190d8ec5d1800dae7eff2456d0a451c91ae3416b5f91be2541cd')
sha256sums_x86_64=('0ceb19e401f42fb8a5c73cda0446315146d0d4801b866481092fcd9690acb514')
sha256sums_aarch64=('142d3448281ed3ca05a4f201fe4926dd1a862475d41fd98c8f7a42ae40be1d44')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${_pkgname}-cli" "${pkgdir}/usr/bin/${_pkgname}-cli"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
