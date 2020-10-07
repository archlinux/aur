# Maintainer: nycko123 <nycko123 at gmail com>
# Contributor: haawda <stefan-husmann at t-online de>
# All the credits go to:
# Previous Maintainer (27.04.2016 - 15.10.2017): Youngbin Han <sukso96100 at gmail com>
# Previous Contributor: blainester <theblainestory at gmail com>
pkgname=micro-bin
pkgver=2.0.8
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=('xclip: Required for copying/pasting text')
conflicts=('micro-git' 'micro' 'micro-nightly-bin')
provides=('micro')
changelog="CHANGELOG"

source_x86_64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux32.tar.gz")
source_aarch64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('7a705a60fe5da8fdfbb1423b560ae120a59af963ec73e3548ef97a6a688cd7cf')
sha256sums_i686=('7b81d1f54ba708295c86e363fa6350e30109249e7d144d3a7d3b5cfa7b861dcc')
sha256sums_aarch64=('c39f49432e4e93c46a21c20bfc250fa2cf7a4dfb01af6d3684b3c45f0ed7c240')

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
