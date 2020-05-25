# Maintainer: nycko123 <nycko123 at gmail com>
# Contributor: haawda <stefan-husmann at t-online de>
# All the credits go to:
# Previous Maintainer (27.04.2016 - 15.10.2017): Youngbin Han <sukso96100 at gmail com>
# Previous Contributor: blainester <theblainestory at gmail com>
pkgname=micro-bin
pkgver=2.0.4
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

sha256sums_x86_64=('3a70702dc7c1d96e41196ff09dfdd446bcbe803255fa95a05c96b2e141a358a8')
sha256sums_i686=('b2ad766c0341a29f7d6fc6e98ae25dcbab95dfce7d34f2b557561d677611e474')

package(){
 install -Dm755 "${srcdir}/${pkgname%-*}-${pkgver}/${pkgname%-*}" "${pkgdir}/usr/bin/${pkgname%-*}"
 install -Dm644 "${srcdir}/${pkgname%-*}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
 for _file in "${srcdir}/${pkgname%-*}-${pkgver}/"*.md; do
	install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname%-*}/$(basename ${_file})"
 done
}
