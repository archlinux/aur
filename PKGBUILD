# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hymkor
_pkgname=bine
pkgname=${_pkgname}-bin
pkgdesc="Terminal Binary Editor"

pkgver=0.8.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686')
_barch=('linux-amd64' 'linux-386')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.zip")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.zip")
sha256sums=('975993bec9e15d5e59b80565a5a0b9ed798eb0fa6f46fa4eb0e6b41c432651ab'
            '76352ed2e1ca24578c1d60a20348cd7dcfba18c3a0262a96fa5b2e276d22cc76')
sha256sums_x86_64=('fa521fc856f935a1c95fce54750c6b28bd416577dfdacf4586e9977764ceca56')
sha256sums_i686=('d99e0de544b9a36f8326c66ef36a3ff9db4539d2bdd7641627a15c0d52af9515')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
