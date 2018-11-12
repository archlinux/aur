# Maintainer: Miguel Peláez <kernelfreeze@outlook.com>
# Contributor: WFCody
# Contributor: milgner

pkgname=jdk8-openj9-bin
pkgver=8.${_pkgver_minor}
pkgrel=1

_pkgver_minor="192"
_pkgver_build="12"
_j9_version="0.11.0"

pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk8"
arch=('x86_64')
url="https://adoptopenjdk.net/index.html?variant=openjdk8-openj9"
license=('GPL')
depends=('java-runtime-common' 'java-environment-common' 'ca-certificates-utils' 'nss')
conflicts=('jdk8-j9-bin')

provides=(
'java-environment=8'
'java-runtime=8'
'java-runtime-headless=8'
)

makedepends=('coreutils' 'bash')
source=("https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-${_j9_version}/OpenJDK8U-jdk_x64_Linux_openj9_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz")
noextract=("OpenJDK8U-jdk_x64_Linux_openj9_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz")

# https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u192-b12_openj9-0.11.0/OpenJDK8U-jdk_x64_linux_openj9_8u192b12_openj9-0.11.0.tar.gz.sha256.txt
sha256sums=('fd7035c60ad3060fccf7ab67c15b722302a1863ebddd3141dc3dd98bd0b25a68')

package() {
    cd "$srcdir"
    
    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf OpenJDK8U-jdk_x64_Linux_openj9_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-${_j9_version}" "${pkgdir}/usr/lib/jvm/java-8-j9"
}

