# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=brimdata
_pkgname=super
_appname=${_pkgname}
pkgname=${_pkgname}db-bin
pkgdesc="An analytics database that puts JSON and relational tables on equal footing"

pkgver=0.1.0
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
sha256sums_x86_64=('673d39817908c9fd1c070972a3da7730a761c1992e545c335bc2eddede80c65f')
sha256sums_aarch64=('0c69cc046bbefd24ebe5575742095b8e9491d2825942ca324d78888ee7975703')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
