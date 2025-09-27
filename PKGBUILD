# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=go-shiori
_pkgname=obelisk
pkgname=${_pkgname}-bin
pkgver=0.91
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="CLI tool for saving web page as single HTML file"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux")
sha256sums=('0a26c303449ce577a88d1ee9987907c5d385f80c8cbc66008aad795572c86234'
            'f255ed5a789939ed3108455fbf5c5a3b2ae4339be28c3b7b4cc2f4ce8742dac6')
sha256sums_x86_64=('5f1799327599e623c1ea25425eef0d40b51e27a7dd70fb23d4a40c75fb9a4081')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
