# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rocajuanma
_pkgname=anvil
pkgname=${_pkgname}-bin
pkgver=2.2.5
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Streamline tool installation and team onboarding"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'f284a4b9206d096047ece0b0ec50a0fe5d6783d77a079fdd14b90c7e0841a9fc')
sha256sums_x86_64=('6244e19d0d05e8e77a1b5e91cae5df86bba7c023f83ae6b54cad987738fc2eda')
sha256sums_aarch64=('328b327f4cfc0b89ed9fa3e7008683187616712591c8df08f2362e5e88b0f1f7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
