# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=brimdata
_pkgname=super
_appname=${_pkgname}
pkgname=${_pkgname}db-bin
pkgdesc="An analytics database that puts JSON and relational tables on equal footing"

pkgver=0.4.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('BSD-3-Clause')

provides=("${_appname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}.${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}.${_barch[1]}.tar.gz")
sha256sums=('7ea248c198a3954cdcb9a99ba67a92e51400086e92204b2c027859b337cb3e3d'
            '1e0caf90614141d28ec61f9003de6b2a55b9845c823dda571cb60a7842eeb451')
sha256sums_x86_64=('41067ee343374c1b946500acdcb2e6e0f130cde7946d95bb38d73507957fce90')
sha256sums_aarch64=('c775b96b1494e5decc935e517a3787d66e0b4458660a4537a0a6d09065aaefbb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
