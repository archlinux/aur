# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=VirusTotal
_pkgname=yara-x
_pkgbin=yr
pkgname=${_pkgname}-bin
pkgver=1.7.1
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
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.gz")
sha256sums=('fdf05444c9178e662fa28810d94a1fa6ec32d7be798241c98094213317265880'
            'fadd7f234cb2b70b3102db5af86649ffe3faa59519cbe1a46e68826c4df039f1')
sha256sums_x86_64=('3e52e2bb437d1c62b5e45569ea3ea5f869aa539f01da8d7e05f03876c5a9a34c')
sha256sums_aarch64=('acb76fd378d41aa65cf0803a1196a1b2fb2dcae4dec77ae3758a8ee9a7f3dc90')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
