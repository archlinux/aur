# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=VirusTotal
_pkgname=yara-x
_pkgbin=yr
pkgname=${_pkgname}-bin
pkgver=1.21.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A pure Rust implementation of YARA"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-3-Clause')

provides=("${_pkgbin}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('fdf05444c9178e662fa28810d94a1fa6ec32d7be798241c98094213317265880'
            'fe5c6f9fde50171d930617d0d21daec6ce089dd9b02853662f5a41dd614ee109')
sha256sums_x86_64=('01585181e8979e36ac10ab123fcf8921cf8ba879bf942916413e091e18d64852')
sha256sums_aarch64=('8d56947d82c7959a65fd4a7327d339d326649f6208c01c9f7fe7fd249e61c66a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
