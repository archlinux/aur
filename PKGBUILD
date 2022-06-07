# Maintainer: Anton Perstenev <anton.perstenyov@gmail.com>

pkgname=jdk18-openj9-bin
pkgrel=2
_j9_version="0.32.0"
pkgver=18.0.1.1
pkgdesc="IBM Semeru OpenJ9 with openjdk18"
arch=('x86_64')
url="https://developer.ibm.com/languages/java/semeru-runtimes/"
license=('GPL')
depends=('java-runtime-common' 'java-environment-common' 'ca-certificates-utils' 'nss')

provides=(
'java-environment=18'
'java-runtime=18'
'java-runtime-headless=18'
)

makedepends=('coreutils' 'bash')
source=("https://github.com/ibmruntimes/semeru18-binaries/releases/download/jdk-${pkgver}+${pkgrel}_openj9-${_j9_version}/ibm-semeru-open-jdk_x64_linux_${pkgver}_${pkgrel}_openj9-${_j9_version}.tar.gz")
noextract=("ibm-semeru-open-jdk_x64_linux_${pkgver}_${pkgrel}_openj9-${_j9_version}.tar.gz")

sha256sums=('708d7d7b5ac3c793f7fa9b045024276b54f973dcb833cccc0be697261884db4a')

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf ibm-semeru-open-jdk_x64_linux_${pkgver}_${pkgrel}_openj9-${_j9_version}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk-${pkgver}+${pkgrel}" "${pkgdir}/usr/lib/jvm/java-18-j9"
}
