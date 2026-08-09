# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=walles
_pkgname=ftop
pkgname=${_pkgname}-bin
pkgver=0.0.25
pkgrel=1
pkgdesc="Finformative top for finding fiery processes"

arch=('x86_64' 'i686' 'aarch64')
_barch=('386' '386' 'arm')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[2]}")
sha256sums=('ed6eec81442ed76d295d2aaadb26efad64c0132c9a793f16bbfa8952583b05c1'
            '2e1ab9140e5149d98da293596d1d664dab580bdb99bea2a4d64dfdde10c22c2d')
sha256sums_x86_64=('5050e6be85369dea9c7bf4f6bd2f3a853b3f0b3026438bce72f98589800dd6cc')
sha256sums_i686=('5050e6be85369dea9c7bf4f6bd2f3a853b3f0b3026438bce72f98589800dd6cc')
sha256sums_aarch64=('bd1ebfb36b194af071e0c58a65b1bf1b2d64a2224c016230d67c637703e50bda')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
