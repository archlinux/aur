# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=tanciaku
_pkgname=tmmpr
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal mind mapper"

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${arch[0]}.tar.gz")
sha256sums=('76e2ec55f85c003295b0ed6c34b969dbf5c4d4cce5d2c08c2ba4856e5f9adfa1'
            'bb44e66f655ab1e47cf0c847f6ba3ba542f8a21218c7c87b06bcb368516dabeb')
sha256sums_x86_64=('cd1b42be6e25038bcd4e7904add36b9488929e5f760079b4f395cf87fab95347')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
