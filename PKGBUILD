# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mikeleppane
_pkgname=chamber
pkgname=${_pkgname}-bin
pkgver=0.5.4
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A secure, local-first secrets manager"
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
            '038b4a70a793c11b100ebdbfb61bdfb56bbfd02e5faac152f479915030f6ad96')
sha256sums_x86_64=('3413e5490498bf60ee9d065c51153c7400866680f95a41de0c0f6781399b9768')
sha256sums_aarch64=('f1052bcbb2825619e0310413170dfe0e77246d97eaeaa830176198622f7b12f6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
