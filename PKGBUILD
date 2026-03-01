# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=tjblackheart
_pkgname=andcli
pkgname=${_pkgname}-bin
pkgver=2.5.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A 2FA TUI for your shell"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux_${_barch[1]}")
sha256sums=('d45afd6fb9c249b4daef3c0362a71ff3c9cfa607c8162c29af42a5546e9b3246'
            'db05cfbfdb363a35fe04d3038e9c785579977e0184905594d2441cef3e99d7cc')
sha256sums_x86_64=('94c5801de61006c2ab5d49b75cc6e994da92da624e9b6d0c6ff7aaa4946c70e5')
sha256sums_aarch64=('c30f15c5bb294a0e3611290e2c0d73ab0f3ec9a8875af5d5927ad71dbe9e163e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
