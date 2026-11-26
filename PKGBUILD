# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=brimdata
_pkgname=super
_appname=${_pkgname}
pkgname=${_pkgname}db-bin
pkgdesc="An analytics database that puts JSON and relational tables on equal footing"

pkgver=0.5.0
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
sha256sums=('f3df100784fc0543d6e720dece7abbee6d882c2b9ec04acf9de84e1bfdce3114'
            '1e0caf90614141d28ec61f9003de6b2a55b9845c823dda571cb60a7842eeb451')
sha256sums_x86_64=('daf4d9261e1d58553cbf5687ce098b64ff6579a7e6c0b23b1dbbb4584d5f0f58')
sha256sums_aarch64=('0acb796edce545316fb819c3dce7fe3b7e2f164ae54bd7ac6f2aca7710aa6255')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
