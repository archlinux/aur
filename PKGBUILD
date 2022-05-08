# Maintainer: Anton Perstenev <anton.perstenyov@gmail.com>

pkgname=jdk18-openj9-bin
pkgrel=10
_pkgver_minor="4"
_j9_version="0.32.0"
pkgver=18.0.1
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

sha256sums=('6e146103169c4e3173c8ce32c549daa8a979c6389bfc3b0b9248f1ecaf37f5ea')

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf ibm-semeru-open-jdk_x64_linux_18.0.1_10_openj9-0.32.0.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk-18.0.1+10" "${pkgdir}/usr/lib/jvm/java-18-j9"
}
