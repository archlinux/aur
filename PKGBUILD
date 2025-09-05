# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mikeleppane
_pkgname=envx
pkgname=${_pkgname}-bin
pkgver=0.5.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A powerful and secure environment variable manager"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('21fb5a5395f0f650feb3688f00c858e59eefa51c3c945a19da2c3ed2a4d8a3d2'
            '56ea3d1bcf9c46368627a6188aef66ae51bcc3f6c19c7515a9da0700993a76e3')
sha256sums_x86_64=('5a821b648edec63238a44827a17b7935c7ac3566503ce5151cb9ae44be197b13')
sha256sums_aarch64=('bd5041d9b0bf53e35a87877c59313b2e2916735b27c66b62528e6c27bdb75491')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
