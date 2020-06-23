# Maintainer: nycko123 <nycko123 at gmail com>
# Contributor: haawda <stefan-husmann at t-online de>
# All the credits go to:
# Previous Maintainer (27.04.2016 - 15.10.2017): Youngbin Han <sukso96100 at gmail com>
# Previous Contributor: blainester <theblainestory at gmail com>
pkgname=micro-bin
pkgver=2.0.5
pkgrel=3
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=('xclip: Required for copying/pasting text')
conflicts=('micro-git' 'micro' 'micro-nightly-bin')
provides=('micro')

source_x86_64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
			# "https://raw.githubusercontent.com/zyedidia/micro/master/assets/packaging/micro.1"
			# "https://raw.githubusercontent.com/zyedidia/micro/master/assets/packaging/micro.desktop")
source_i686=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux32.tar.gz")
			# "https://raw.githubusercontent.com/zyedidia/micro/master/assets/packaging/micro.1"
			# "https://raw.githubusercontent.com/zyedidia/micro/master/assets/packaging/micro.desktop")
source=("https://raw.githubusercontent.com/zyedidia/micro/master/assets/packaging/micro.1"
			"https://raw.githubusercontent.com/zyedidia/micro/master/assets/packaging/micro.desktop"
			"micro.svg::https://micro-editor.github.io/micro_files/micro-logo-mark.svg")

sha256sums=('e753edc9899152ab1c70926b8f096d0bdcd1efa9213dd27fcef2e0b85236153e'
            '3fd83fda3c2a6711edbc5e4158db5ba0898e8b59760d30f8e3bce7642e071be7'
            '88686fe20569951f401191c0cf232e1d4a915b549137127681b7b1c5a9c30a2b')
sha256sums_x86_64=('4f159a4b8a08c48559bd94b3aacdca9a6188af0f9919fec61e01dde44f0f4fa0')
sha256sums_i686=('6b60ca069e9b28d1d8ddb3d70a191bab8a588b5eb8903b1fab794789521bf37d')

package(){
 install -Dm755 "${srcdir}/${pkgname%-*}-${pkgver}/${pkgname%-*}" "${pkgdir}/usr/bin/${pkgname%-*}"
 install -Dm644 "${srcdir}/${pkgname%-*}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
 install -Dm644 "${srcdir}/${pkgname%-*}-${pkgver}/LICENSE-THIRD-PARTY" "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE-THIRD-PARTY"
 for _file in "${srcdir}/${pkgname%-*}-${pkgver}/"*.md; do
	install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname%-*}/$(basename ${_file})"
 done
 install -Dm644 "${srcdir}/micro.1" "${pkgdir}/usr/share/man/man1/micro.1"
 install -Dm644 "${srcdir}/micro.desktop" "${pkgdir}/usr/share/applications/micro.desktop"
 install -Dm644 "${srcdir}/micro.svg" "${pkgdir}/usr/share/pixmaps/micro.svg"
}
