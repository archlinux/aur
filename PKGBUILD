# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Anton Perstenev <anton.perstenyov@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=jdk18-openj9-bin
pkgver=18.0.2.1
pkgrel=1
_jdk_version=18.0.2
_jdk_patch=9
_j9_version=0.33.1
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
source=("https://github.com/ibmruntimes/semeru18-binaries/releases/download/jdk-${_jdk_version}+${_jdk_patch}_openj9-${_j9_version}/ibm-semeru-open-jdk_x64_linux_${_jdk_version}_${_jdk_patch}_openj9-${_j9_version}.tar.gz")
noextract=("ibm-semeru-open-jdk_x64_linux_${_jdk_version}_${_jdk_patch}_openj9-${_j9_version}.tar.gz")

sha256sums=('b694d47666035b1f7870bc3749aa7c1903d50976eab3772fd81c32dab2aa8e64')

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf ibm-semeru-open-jdk_x64_linux_${_jdk_version}_${_jdk_patch}_openj9-${_j9_version}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk-${_jdk_version}+${_jdk_patch}" "${pkgdir}/usr/lib/jvm/java-18-j9"
}
