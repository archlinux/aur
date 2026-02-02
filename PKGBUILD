# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=esimov
_pkgname=pigo
pkgname=${_pkgname}-bin
pkgdesc="Fast face detection, pupil/eyes localization and facial landmark points detection"

pkgver=1.4.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("facefinder-${pkgver}::${_urlraw}/cascade/facefinder"
		"puploc-${pkgver}::${_urlraw}/cascade/puploc"
		"lp38-${pkgver}::${_urlraw}/cascade/lps/lp38"
		"lp42-${pkgver}::${_urlraw}/cascade/lps/lp42"
		"lp44-${pkgver}::${_urlraw}/cascade/lps/lp44"
		"lp46-${pkgver}::${_urlraw}/cascade/lps/lp46"
		"lp81-${pkgver}::${_urlraw}/cascade/lps/lp81"
		"lp82-${pkgver}::${_urlraw}/cascade/lps/lp82"
		"lp84-${pkgver}::${_urlraw}/cascade/lps/lp84"
		"lp93-${pkgver}::${_urlraw}/cascade/lps/lp93"
		"lp312-${pkgver}::${_urlraw}/cascade/lps/lp312"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('d8014993e7298c7b1865d1f8b855d6dbf4ec5c808bf879e2091ab6837abf90cd'
            'aa01adf34e5af6ed333be75e934275fc39fba2b63790cb340353b2d459c96ccc'
            '5056ae37210c49511ada2dfcf35a8c34b742c5f8a44729cc65be8fb4e932a948'
            '3b7d22017b2f142c9bca5cc118f0a3ff2e4e9e12e4427314c63a9953c0dccdb7'
            'c63d2a04bdf058923b3c7fa1b1b5c77de7e007bf71a585f20c7cfbb3b8a7f96a'
            'f5d08fa7c700387f3a34a8ac23a1cac2eeb9d74c766efb2a95c50eb2bfacbfb7'
            '5085fa475d1bfa2e16e2597d1e0b0a9bdd5c733d5053e303599abda0bc166df6'
            '61ba39229d9c15bed02277ee804abb3363f97048a0b428158fb87803dec4d8f8'
            '2389ac114b9e18a2f6036fe9728be47baca012d42993167b8146a7cfe96b334f'
            '7e7ad437cb7488a3c37f2cbcadb0a5ee9ee4561fd17085de5eb5ec62b66480bd'
            'f36f8ff56b61b982d20cfc63efadf627d7960850d24d954ce13d0552ba8f74f4'
            'b33c6f418a5c2407c24250ea0ce13af06b9050c695bdeae81badcbbfe688a8c5')
sha256sums_x86_64=('80adf887a2e0df15631b5f4755e8405b0420b1848a96d305f7a73fcbea1fecbc')

case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${_CARCH}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "facefinder-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/facefinder"
	install -Dm644 "puploc-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/puploc"
	install -Dm644 "lp38-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/lps/lp38"
	install -Dm644 "lp42-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/lps/lp42"
	install -Dm644 "lp44-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/lps/lp44"
	install -Dm644 "lp46-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/lps/lp46"
	install -Dm644 "lp81-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/lps/lp81"
	install -Dm644 "lp82-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/lps/lp82"
	install -Dm644 "lp84-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/lps/lp84"
	install -Dm644 "lp93-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/lps/lp93"
	install -Dm644 "lp312-${pkgver}" "${pkgdir}/usr/share/${_pkgname}/cascade/lps/lp312"

	install -Dm644 "${_pkgname}-${pkgver}-${_CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
