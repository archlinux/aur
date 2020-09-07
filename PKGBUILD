# Maintainer: nycko123 <nycko123 at gmail com>
# Contributor: haawda <stefan-husmann at t-online de>
# All the credits go to:
# Previous Maintainer (27.04.2016 - 15.10.2017): Youngbin Han <sukso96100 at gmail com>
# Previous Contributor: blainester <theblainestory at gmail com>
pkgname=micro-bin
pkgver=2.0.7
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=('xclip: Required for copying/pasting text')
conflicts=('micro-git' 'micro' 'micro-nightly-bin')
provides=('micro')

source_x86_64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux32.tar.gz")

sha256sums_x86_64=('843b8ffa6e10cb0fb67bae5047af496a0c13d3ac678df0fb44b5ec00eca62615')
sha256sums_i686=('a093c18ff48c5cf9103e546e43efdc6c31375ee7028b88f434686c7e1d9aaeb2')

package(){
 install -Dm755 "${srcdir}/${pkgname%-*}-${pkgver}/${pkgname%-*}" "${pkgdir}/usr/bin/${pkgname%-*}"
 install -Dm644 "${srcdir}/${pkgname%-*}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
 install -Dm644 "${srcdir}/${pkgname%-*}-${pkgver}/LICENSE-THIRD-PARTY" "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE-THIRD-PARTY"
 for _file in "${srcdir}/${pkgname%-*}-${pkgver}/"*.md; do
	install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname%-*}/$(basename ${_file})"
 done
 install -Dm644 "${srcdir}/${pkgname%-*}-${pkgver}/micro.1" "${pkgdir}/usr/share/man/man1/micro.1"
 install -Dm644 "${srcdir}/${pkgname%-*}-${pkgver}/micro.desktop" "${pkgdir}/usr/share/applications/micro.desktop"
 install -Dm644 "${srcdir}/${pkgname%-*}-${pkgver}/micro.svg" "${pkgdir}/usr/share/pixmaps/micro.svg"
}
