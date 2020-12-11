# Maintainer: Lari Tikkanen <lartza@outlook.com>
# Contributor: Miguel Peláez <kernelfreeze@outlook.com>
# Contributor: WFCody
# Contributor: milgner
# Contributor: alkalien

pkgname=jdk8-openj9-bin
pkgrel=1
_pkgver_minor="275"
_pkgver_build="01"
_j9_version="0.23.0"
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

sha256sums=('8bb74ff7ab2f64ced23212ee0520295c01b6f2d7558fd6e488a8ca795ced1ebd')

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf OpenJDK8U-jdk_x64_Linux_openj9_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk8u${_pkgver_minor}-b${_pkgver_build}" "${pkgdir}/usr/lib/jvm/java-8-j9"
}
