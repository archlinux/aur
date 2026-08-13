# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=walles
_pkgname=moor
pkgname=${_pkgname}-bin
pkgver=2.16.3
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration"

arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('BSD-2-Clause-Views')

replaces=('moar' 'moar-bin')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.1::${_urlraw}/${_pkgname}.1"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"MOUSE-${pkgver}.md::${_urlraw}/MOUSE.md"
		"README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[2]}")
sha256sums=('4b5fe5b123f7719c34799f1348dbcda0c769bdfb84d5458ed8e962a2e6c7063e'
            'f5f073e5c2be82c3e2cb7e0b67a5a72c7f563f08bf7e45da3ed05b8c1358d45c'
            '663fec717c38f524c8e5c707ea17bd5d6ac92433f1487ade5f0e6fdebfee1358'
            'babf8fcc6522d5ed6af45969e0e57deaf1db830da53a0a90d0f3d4536bdfd0ee')
sha256sums_x86_64=('250fc9596b723c7e1e1e5157860d586cfaeb1afdcc31505ed66c512c2dfe56e5')
sha256sums_i686=('96f95b89386f0bf833d6aa7379d0e4d753e4fd81c2fdfa736ff667f5c2e817bb')
sha256sums_aarch64=('283fa216483c74c1f3b0d5791f9472bdbb951917356ec82f4a35af3b88d922dc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "MOUSE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/MOUSE.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
