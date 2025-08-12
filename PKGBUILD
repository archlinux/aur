# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=vaibhav-mattoo
_pkgname=cxt
pkgname=${_pkgname}-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="A command-line tool that aggregates file and directory contents into your clipboard, perfect for providing project context to AI chatbots"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('7b7f5c05777003b721d6114361620e45ca5ebd477f33d4f52decc8a1c159e309'
            '3f61f642dd68a31505970244da08d89408d147855c925479edc437de6f4305cb')
sha256sums_x86_64=('46834f1040a95f63cf068d5feeff6d26210548f1c61390aad9da3285cb52c06b')
sha256sums_aarch64=('60278ada65affc763d1c36da23b0981f54dd64bc1e2b7d2216a6e980f4d3614f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
