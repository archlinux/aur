# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sergey Kasmy <SleeplessSloth79 [at] gmail [dot] com>

_pkgauthor=gsamokovarov
_pkgname=jump
pkgname=${_pkgname}-bin
pkgdesc="Navigate faster by learning your habits"

pkgver=0.69.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.1::${_urlraw}/man/${_pkgname}.1"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.txt")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[0]}_binary")
sha256sums=('a36a216cfb1df381a3817080c4a06630805859d99801499ee70c47c7f34b4bc1'
            '8dab3ed677a55bad13ba48738a95b28bb1f3f52a8bc5a3cdda1f0ec8691ed499'
            'b16631067cb8bcf731e7ff3da91ecb0744fbdae52db68017637aec55bfef0617')
sha256sums_x86_64=('7b1be5c608ee8364caac4313fa37d0a0c69cea8cb1e65e4481160afda00d8ab1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
