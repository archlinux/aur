# Maintainer: Lari Tikkanen <lartza@outlook.com>
# Contributor: Miguel Peláez <kernelfreeze@outlook.com>
# Contributor: WFCody
# Contributor: milgner
# Contributor: alkalien

pkgname=jdk8-openj9-bin
pkgrel=1
_pkgver_minor="402"
_pkgver_build="06"
_j9_version="0.43.0"
pkgver=8.u${_pkgver_minor}.b${_pkgver_build}
pkgdesc="IBM Semeru OpenJ9 with openjdk8"
arch=('x86_64')
url="https://developer.ibm.com/languages/java/semeru-runtimes/"
license=('GPL')
depends=('java-runtime-common' 'java-environment-common' 'ca-certificates-utils' 'nss')
replaces=('jdk8-j9-bin')

provides=(
'java-environment=8'
'java-runtime=8'
'java-runtime-headless=8'
)

makedepends=('coreutils' 'bash')
source=("https://github.com/ibmruntimes/semeru8-binaries/releases/download/jdk8u${_pkgver_minor}-b${_pkgver_build}_openj9-${_j9_version}/ibm-semeru-open-jdk_x64_linux_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz")
noextract=("ibm-semeru-open-jdk_x64_linux_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz")

sha256sums=('6e5f623ca42d1f37e769a44b26641a6b0382145f5eb8d9c3ff980e6ebcd7ac2e')

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf ibm-semeru-open-jdk_x64_linux_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk8u${_pkgver_minor}-b${_pkgver_build}" "${pkgdir}/usr/lib/jvm/java-8-j9"
}
