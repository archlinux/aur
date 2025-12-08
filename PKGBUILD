# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unhappychoice
_pkgname=gitlogue
pkgname=${_pkgname}-bin
pkgver=0.6.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Turn your Git history into a living, animated story"
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
sha256sums=('52224f3fb44160a2b043abc871476ce429ef1224651d739560af6d34bd0f084d'
            '8f7d4feb676b3700f48611aa9a3c8e444b7877593efb52fc90235577f3148cc9')
sha256sums_x86_64=('800ea2cd9a33dbdbea83545b4e941255b1929d36601a00be22bab057d46509f0')
sha256sums_aarch64=('d2a89662fdcfb36b29ced22ed1cc98c60d9ed4bdb98ee65775e50b5836fdd905')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
