# Maintainer: Lari Tikkanen <lartza@outlook.com>
# Contributor: Miguel Peláez <kernelfreeze@outlook.com>
# Contributor: WFCody
# Contributor: milgner
# Contributor: alkalien

pkgname=jdk8-openj9-bin
pkgrel=1
_pkgver_minor="252"
_pkgver_build="09"
_j9_version="0.20.0"
pkgver=8.u${_pkgver_minor}.b${_pkgver_build}
pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk8"
arch=('x86_64')
url="https://adoptopenjdk.net/index.html?variant=openjdk8-openj9"
license=('GPL')
depends=('java-runtime-common' 'java-environment-common' 'ca-certificates-utils' 'nss')
replaces=('jdk8-j9-bin')

provides=(
'java-environment=8'
'java-runtime=8'
'java-runtime-headless=8'
)

makedepends=('coreutils' 'bash')
source=("https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-${_j9_version}/OpenJDK8U-jdk_x64_Linux_openj9_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz")
noextract=("OpenJDK8U-jdk_x64_Linux_openj9_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz")

sha256sums=('910ae847109a6dd1b6cf69baa7615ea2cce8cff787e5a9349a5331ce7604f3a5')

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf OpenJDK8U-jdk_x64_Linux_openj9_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk8u${_pkgver_minor}-b${_pkgver_build}" "${pkgdir}/usr/lib/jvm/java-8-j9"
}
