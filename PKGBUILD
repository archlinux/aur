# Maintainer: Miguel Peláez <kernelfreeze@outlook.com>
# Contributor: WFCody

pkgname=jdk8-openj9-bin
_pkgver_minor="162"
_pkgver_build="12"
pkgver=8.${_pkgver_minor}
pkgrel=1

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
source=("https://github.com/AdoptOpenJDK/openjdk8-openj9-releases/releases/download/jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-0.8.0/OpenJDK8-OPENJ9_x64_Linux_jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-0.8.0.tar.gz")
noextract=("OpenJDK8-OPENJ9_x64_Linux_jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-0.8.0.tar.gz")

# https://github.com/AdoptOpenJDK/openjdk8-openj9-releases/releases/download/jdk8u162-b12_openj9-0.8.0/OpenJDK8-OPENJ9_x64_Linux_jdk8u162-b12_openj9-0.8.0.sha256.txt
sha256sums=('4a90944fbe96cb6452391e952cc7c9b5136fb042a445eb205e31a029fd72fd7c')

package() {
    cd "$srcdir"
    
    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf OpenJDK8-OPENJ9_x64_Linux_jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-0.8.0.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-0.8.0" "${pkgdir}/usr/lib/jvm/java-8-j9"
}

