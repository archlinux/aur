# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname="among-us-dumpy-gif-maker"
_pkgver="4.2.0"
_jar="Among-Us-Dumpy-Gif-Maker-${_pkgver}-all.jar"

pkgname="${_pkgname}"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="A tool that lets you make Among Us Dumpy GIFs"
arch=("x86_64")
url="https://github.com/ThatOneCalculator/Among-Us-Dumpy-Gif-Maker"
license=("GPL")
depends=("jre-openjdk" "imagemagick")
source_x86_64=("${_jar}::https://github.com/ThatOneCalculator/Among-Us-Dumpy-Gif-Maker/releases/download/v${_pkgver}/${_jar}" "${_pkgname}::https://raw.githubusercontent.com/ThatOneCalculator/Among-Us-Dumpy-Gif-Maker/main/among-us-dumpy-gif-maker")
noextract=("${_jar}" "${_pkgname}")
sha256sums_x86_64=("SKIP" "SKIP")

prepare() {
    chmod +x "${_pkgname}"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_jar}" "${pkgdir}/usr/lib/${_jar}"
}
