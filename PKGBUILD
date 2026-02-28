# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=brimdata
_pkgname=super
_appname=${_pkgname}
pkgname=${_pkgname}db-bin
pkgdesc="An analytics database that puts JSON and relational tables on equal footing"

pkgver=0.2.0
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
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.txt")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}.${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}.${_barch[1]}.tar.gz")
sha256sums=('98d8ce207cd2c2fbcb2b6b20271ca9a00100ef807e1730c4e3e4b060a09e98a2'
            '1b37b0c058da81d58ff531c34a564078588849614ee0afd48cccb99c7747ebcf')
sha256sums_x86_64=('712be17a70a2c76151dd8bac0aadec241144860700730ad597c4763dae092c49')
sha256sums_aarch64=('8b2d93e1e0860d5c076d82a8b8bba304c5a9d915f79dd88d230dbc69afe40d64')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
