# Maintainer: bemxio <bemxiov at protonmail dot com>
# Maintainer: Joseph Brains <jnbrains at gmail dot com>

_pkgname=android-apktool
pkgname=${_pkgname}-bin
pkgver=2.8.1
pkgrel=1
pkgdesc='A tool for reverse engineering Android apk files'
arch=('any')
url='https://github.com/iBotPeaches/Apktool'
license=('Apache')
depends=('java-runtime>=8')
conflicts=('android-apktool' 'android-apktool-git')
provides=('android-apktool')
source=("https://github.com/iBotPeaches/Apktool/releases/download/v${pkgver}/apktool_${pkgver}.jar"
        'apktool')
noextract=("apktool_${pkgver}.jar")
sha256sums=('7b4a8e1703e228d206db29644b71141687d8a111b55b039b08b02dfa443ab0f9'
            'f1d4cf2eb2d12512dbbe583cd7fb35b8b8a44e0e3a1d5e88015ab01d9bc1ce62')
changelog=Changelog

package() {
  install -Dm 0755 "${srcdir}/apktool" "${pkgdir}/usr/bin/apktool"
  install -Dm 0644 "${srcdir}/apktool_${pkgver}.jar" "${pkgdir}/usr/share/${_pkgname}/apktool.jar"
}
