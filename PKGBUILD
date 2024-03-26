# Maintainer: bemxio <bemxiov at protonmail dot com>
# Maintainer: Joseph Brains <jnbrains at gmail dot com>

_pkgname=android-apktool
pkgname=${_pkgname}-bin

pkgdesc="A tool for reverse engineering Android .apk files"

pkgver=2.9.3
pkgrel=2

arch=(i686 x86_64)

url="https://github.com/iBotPeaches/Apktool"
license=("Apache-2.0")

depends=("java-runtime>=8")

provides=(android-apktool)
conflicts=(android-apktool android-apktool-git)

source=("https://github.com/iBotPeaches/Apktool/releases/download/v${pkgver}/apktool_${pkgver}.jar" 
        "apktool")
sha256sums=("7956eb04194300ce0d0a84ad18771eebc94b89fb8d1ddcce8ea4c056818646f4"
            "48a5c9d664c88c8beac4a85461e84437d104a42dac6334322a3bafca12b63bae")

noextract=("apktool_${pkgver}.jar")

package() {
    # copy the main .jar file
    install -Dm644 "apktool_${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/apktool.jar"

    # copy the executable script
    install -Dm755 apktool "${pkgdir}/usr/bin/apktool"
}