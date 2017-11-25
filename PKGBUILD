# Maintainer: Miguel Peláez <kernelfreeze@outlook.com>
# Contributor: WFCody

pkgname=jdk8-openj9-bin
_pkgver_minor="152"
_pkgver_build="16"
pkgver=8.${_pkgver_minor}
pkgrel=1

pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk8"
arch=('x86_64')
url="https://adoptopenjdk.net/index.html?variant=openjdk8-openj9"
license=('GPL')
depends=('java-runtime-common' 'java-environment-common' 'ca-certificates-utils' 'nss')

provides=(
'java-environment=8'
'java-runtime=8'
'java-runtime-headless=8'
)

makedepends=('coreutils' 'bash')
source=("https://github.com/AdoptOpenJDK/openjdk8-openj9-releases/releases/download/jdk8u${_pkgver_minor}-b${_pkgver_build}/OpenJDK8-OPENJ9_x64_Linux_jdk8u${_pkgver_minor}-b${_pkgver_build}.tar.gz")
noextract=("OpenJDK8-OPENJ9_x64_Linux_jdk8u${_pkgver_minor}-b${_pkgver_build}.tar.gz")

# https://github.com/AdoptOpenJDK/openjdk8-openj9-releases/releases/download/jdk8u152-b16/OpenJDK8-OPENJ9_x64_Linux_jdk8u152-b16.sha256.txt
sha256sums=('b4350498f8781b40e6ed6117eded0748c2f2dfa57dcd441195eac272f9d18e33')

package() {
    cd "$srcdir"
    
    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf OpenJDK8-OPENJ9_x64_Linux_jdk8u${_pkgver_minor}-b${_pkgver_build}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk8u${_pkgver_minor}-b${_pkgver_build}" "${pkgdir}/usr/lib/jvm/java-8-j9"
}

