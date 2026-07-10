# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=vaibhav-mattoo
_pkgname=cxt
pkgname=${_pkgname}-bin
pkgver=0.1.9
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
            'eba8002cf1daac48bf778b54e04ec558fc1bfcfe90c6eb1d7afde59adf7f986d')
sha256sums_x86_64=('c802019041c8ee252ee4eb441b5294a34debca27ede0acfc6d90489a68a8daaf')
sha256sums_aarch64=('b2a320585ccc34053582c519bd1e01eda61bf672aa8d6bdc5cf23ca1f2893197')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
