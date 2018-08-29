# Maintainer: Miguel Peláez <kernelfreeze@outlook.com>
# Contributor: WFCody
# Contributor: milgner

pkgname=jdk8-openj9-bin
pkgver=8.${_pkgver_minor}
pkgrel=1

_pkgver_minor="181"
_pkgver_build="13"
_j9_version="0.9.0"

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
source=("https://github.com/AdoptOpenJDK/openjdk8-openj9-releases/releases/download/jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-${_j9_version}/OpenJDK8-OPENJ9_x64_Linux_jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-${_j9_version}.tar.gz")
noextract=("OpenJDK8-OPENJ9_x64_Linux_jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-0.9.0.tar.gz")

# https://github.com/AdoptOpenJDK/openjdk8-openj9-releases/releases/download/jdk8u181-b13_openj9-0.9.0/OpenJDK8-OPENJ9_ppc64le_Linux_jdk8u181-b13_openj9-0.9.0.sha256.txt
sha256sums=('c90fa5826c2d4898d70a24239cd958f0a4e1afb07ef578da2fb5969637bfa22f')

package() {
    cd "$srcdir"
    
    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf OpenJDK8-OPENJ9_x64_Linux_jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-${_j9_version}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk8u${_pkgver_minor}-b${_pkgver_build}" "${pkgdir}/usr/lib/jvm/java-8-j9"
}

