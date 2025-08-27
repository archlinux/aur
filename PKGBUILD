# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=joshi4
_pkgname=splash
pkgname=${_pkgname}-bin
pkgver=0.9.5
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Add color to your logs"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "AGENT-${pkgver}.md::${_urlraw}/AGENT.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[2]}")
sha256sums=('72333f9d12356bf592af7d5f3ad5c96fdc667e61d4c999e7a44fb46044e2c0a3'
            '17cd30271113feb232b43f04df6ed87cf1cf1fe29e584a8b6e9406502bcfa317'
            '7f5fd7ff1af46441ffe943ae97db4f2e6d6f01304a9563a952a3895aff12f63a')
sha256sums_x86_64=('1f0fd2f773e5a1adab760751dfbd7d5bd55afa14cb95f6fdf7575a0c977f77d7')
sha256sums_i686=('17118c46e776c1bb0605e74f94e9044252d48b176556f7053ff5ee21504cb32f')
sha256sums_aarch64=('f981a38410c34fa3b4313d2e204f34f4103547cdde4a7b008b07a07989bcf73f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "AGENT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AGENT.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
