# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=tjblackheart
_pkgname=andcli
pkgname=${_pkgname}-bin
pkgver=2.6.0
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
            '8671871a1e6d9da3fd86b284d5cee197f1f8a5e321e716046b896eec1d5e78b3')
sha256sums_x86_64=('a831a35980188cc584c1de5ba72af12d5fe79c6163a3c397cbc85bb43f7c9ce8')
sha256sums_aarch64=('3be439cfc32e394b9c1e641a127295cbbeac318468c4e06ef4ca75b65ec45df4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
