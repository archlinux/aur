# Maintainer: nycko123 <nycko123 at gmail com>
# Contributor: haawda <stefan-husmann at t-online de>
# All the credits go to:
# Previous Maintainer (27.04.2016 - 15.10.2017): Youngbin Han <sukso96100 at gmail com>
# Previous Contributor: blainester <theblainestory at gmail com>
pkgname=micro-bin
pkgver=2.0.6
pkgrel=1
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
sha256sums_x86_64=('af330834fd2f6ce0ab11515f36d07658b8ec0e1959fcaea6f7e29d8ba49d4c87')
sha256sums_i686=('a6db6c6a1dbefec939137b754e88741d47ffd9aa8e8ca3f94088eb6889f72590')

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
