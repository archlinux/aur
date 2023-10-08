# Maintainer: bemxio <bemxiov at protonmail dot com>
# Maintainer: Joseph Brains <jnbrains at gmail dot com>

_pkgname=android-apktool
pkgname=${_pkgname}-bin

pkgdesc="A tool for reverse engineering Android .apk files"

pkgver=2.9.0
pkgrel=2

arch=(i686 x86_64)

url="https://github.com/iBotPeaches/Apktool"
license=("Apache")

depends=("java-runtime>=8")

provides=(android-apktool)
conflicts=(android-apktool android-apktool-git)

source=("https://github.com/iBotPeaches/Apktool/releases/download/v${pkgver}/apktool_${pkgver}.jar" "apktool")
md5sums=("246e7208cfb92c73d21e4e6a8909dda1" "2d55a165b924e5bbe2dd1d4427f128fd")

noextract=("apktool_${pkgver}.jar")

package() {
    # copy the main .jar file
    install -Dm644 "apktool_${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/apktool.jar"

    # copy the executable script
    install -Dm755 "apktool" "${pkgdir}/usr/bin/apktool"
}
