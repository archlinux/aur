# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unhappychoice
_pkgname=gitlogue
pkgname=${_pkgname}-bin
pkgver=0.12.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A cinematic Git commit replay tool for the terminal"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('ISC')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'zlib' 'git')

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('309df86ecce0bbb435db28983f1e9facdd37f2b9b021a3bd275d2a2b347209d6'
            '8f7d4feb676b3700f48611aa9a3c8e444b7877593efb52fc90235577f3148cc9')
sha256sums_x86_64=('7da67cf99d5304b58242bb641d3b80ce7a7535ac80991db18e0805742c39bbec')
sha256sums_aarch64=('6674f9af4ed8477809bda07a1088e210f6c2cd6391cbfaf0e0fdca009c9817a2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
