# Maintainer: bemxio <bemxiov at protonmail dot com>
# Maintainer: Joseph Brains <jnbrains at gmail dot com>

_pkgname=android-apktool
pkgname=${_pkgname}-bin

pkgdesc="A tool for reverse engineering Android .apk files"

pkgver=2.9.2
pkgrel=1

arch=(i686 x86_64)

url="https://github.com/iBotPeaches/Apktool"
license=("Apache")

depends=("java-runtime>=8")

provides=(android-apktool)
conflicts=(android-apktool android-apktool-git)

source=("https://github.com/iBotPeaches/Apktool/releases/download/v${pkgver}/apktool_${pkgver}.jar"
    "apktool")
sha256sums=('831f0ffc97b6f20f511d6183cbf6785464d341aacb0fb7e6f22ef0c7b228911a'
            '48a5c9d664c88c8beac4a85461e84437d104a42dac6334322a3bafca12b63bae')

noextract=("apktool_${pkgver}.jar")

package() {
    # copy the main .jar file
    install -Dm644 "apktool_${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/apktool.jar"

    # copy the executable script
    install -Dm755 "apktool" "${pkgdir}/usr/bin/apktool"
}
