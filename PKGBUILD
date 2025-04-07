# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=CodeFlowShai
_pkgname=secho
pkgname=${_pkgname}-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A dramatic, colorful, emotionally unstable replacement for echo"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'c274ba065e75b6a5c44f66f1ba20296cadc793371913173970b4dbfa5570af0b')
sha256sums_x86_64=('b159b937a66719af89ad9da394cbc4b44f583440b3e15add6c9c7a83e43d77d5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
