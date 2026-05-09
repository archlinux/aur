# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=tjblackheart
_pkgname=andcli
pkgname=${_pkgname}-bin
pkgver=2.6.2
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
            'c3b62f975eea42c320c8b78be3b56b930cfcc60c91bb7360fdae4a20f04aff87')
sha256sums_x86_64=('4da129c26a4c66ff42e8af11c3fee2a9cbd5a1215d16223f43925c76479e9308')
sha256sums_aarch64=('1523f3bd4827447cba700881346e2d54eeeb4d43cfa7477cff418f00af272045')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
