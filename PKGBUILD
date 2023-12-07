# Maintainer: bemxio <bemxiov at protonmail dot com>
# Maintainer: Joseph Brains <jnbrains at gmail dot com>

_pkgname=android-apktool
pkgname=${_pkgname}-bin

pkgdesc="A tool for reverse engineering Android .apk files"

pkgver=2.9.1
pkgrel=1

arch=(i686 x86_64)

url="https://github.com/iBotPeaches/Apktool"
license=("Apache")

depends=("java-runtime>=8")

provides=(android-apktool)
conflicts=(android-apktool android-apktool-git)

source=("https://github.com/iBotPeaches/Apktool/releases/download/v${pkgver}/apktool_${pkgver}.jar"
    "apktool")
sha256sums=('de7ce8aa109acb649e7f69cfe91030ffc20dbcc46edd8abbf6c2d1e36cfccd7b'
            '48a5c9d664c88c8beac4a85461e84437d104a42dac6334322a3bafca12b63bae')

noextract=("apktool_${pkgver}.jar")

package() {
    # copy the main .jar file
    install -Dm644 "apktool_${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/apktool.jar"

    # copy the executable script
    install -Dm755 "apktool" "${pkgdir}/usr/bin/apktool"
}
