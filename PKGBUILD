# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=IngoMeyer441
_pkgname=dwatch
pkgname=${_pkgname}-bin
pkgver=0.4.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A tool to watch command output for differences and send notifications."
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[0]}")
sha256sums=('06574e43e0030b56bf45e27b23de72402bfb742b277004fa6c3cd8e0883c91d4'
            'dcfdbba52a8bd9363823539b05d8b4c313bbc0ad950a34f4e10c4551f791b223')
sha256sums_x86_64=('b4cf2124ef17f1d8a62b9755db52f0e90c81972bce66df4778cb193675ecf05f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
