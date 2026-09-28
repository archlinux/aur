# Maintainer: bemxio <bemxiov at protonmail dot com>
# Maintainer: Joseph Brains <jnbrains at gmail dot com>

_pkgname=android-apktool
pkgname=${_pkgname}-bin

pkgdesc="A tool for reverse engineering Android .apk files"

pkgver=3.0.3
pkgrel=1

arch=(any)

url="https://apktool.org"
license=("Apache-2.0")

depends=("java-runtime>=8")

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_${pkgver}.jar"
  "apktool")
sha256sums=('dbf930b076c6b9be08d57c449cacefc3bdd6b71ebd59b3066fc0e1f5b14f9423'
            '48a5c9d664c88c8beac4a85461e84437d104a42dac6334322a3bafca12b63bae')

noextract=("apktool_${pkgver}.jar")

package() {
  # copy the main .jar file
  install -Dm644 "apktool_${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/apktool.jar"

  # copy the executable script
  install -Dm755 apktool "${pkgdir}/usr/bin/apktool"
}
