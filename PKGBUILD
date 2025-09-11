# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=VincenzoManto
_pkgname=Datacmd
pkgname=${_pkgname,,}-bin
pkgver=0.0.3.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Fastest and coolest way to turn raw data into stunning terminal dashboards"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname,,}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname,,}-linux")
sha256sums=('2d9c4055ad200a9d2961d2405a4015a969a76ee0af9c80e71511e0455d5a7ecb'
            '111811d177b43364216346b5f736184a6e2160d8299acde45e71137d2c82e1a6')
sha256sums_x86_64=('a803e97e2c46bd4abed4558a060b54c0005f4700379dbc3f423ab72a8121bdcd')


package() {
	cd "${srcdir}/" || exit

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm755 "${_pkgname,,}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname,,}"
}
