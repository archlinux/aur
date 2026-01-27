# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mainak55512
_pkgname=qwe
pkgname=${_pkgname}-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."

arch=('x86_64')
_barch=('x64_linux')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_barch[0]}.zip")
sha256sums=('7e0e5f38df6874a935f460ed5f8361a7c90eb402cf7e6a4b4a74328be9e5eab7'
            '5f8c1ed98719545d8d057269852f9e446e0ad092135ec5e92374dc8ce9e0e6ad')
sha256sums_x86_64=('ddc54f804c39e81a0ade353f7b4172e847bc05e85699ca3b4d179723117f6c0a')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "release/${_CARCH}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
