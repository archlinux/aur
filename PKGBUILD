# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=brimdata
_pkgname=super
_appname=${_pkgname}
pkgname=${_pkgname}db-bin
pkgdesc="An analytics database that puts JSON and relational tables on equal footing"

pkgver=0.3.0
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
sha256sums=('98d8ce207cd2c2fbcb2b6b20271ca9a00100ef807e1730c4e3e4b060a09e98a2'
            '5fe9becd3d36c26e5f1788b45040953fc023b5e7dd823081d90b5c5f84ba70b2')
sha256sums_x86_64=('2bbc1fab55be4124a4ffa253eba806590b73509935ac8740599a47caf9d3185d')
sha256sums_aarch64=('81384df59e7ca8d2a59855e03040c58a7402539b75dc55e78de46bf68cb49257')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
