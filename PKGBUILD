# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mikeleppane
_pkgname=envx
pkgname=${_pkgname}-bin
pkgver=0.6.0
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
            '25754a90e9ecd2935d4df1d769cf2b7842371a4677c28697ef8ad8aa149b861b')
sha256sums_x86_64=('4807129f5bd43850cff7870d632db8885069eb3dfec7a925046af1fb8c18b616')
sha256sums_aarch64=('e9d029d71b87d183374e3aabc7356c1343012243755669c6e9d591ffcf03ba99')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
