# Maintainer: Lari Tikkanen <lartza@outlook.com>
# Contributor: Miguel Peláez <kernelfreeze@outlook.com>
# Contributor: WFCody
# Contributor: milgner
# Contributor: alkalien

pkgname=jdk8-openj9-bin
pkgrel=1
_pkgver_minor="382"
_pkgver_build="05"
_j9_version="0.40.0"
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

sha256sums=('d148b8c7732f355154dc99056280496360183f3b0135dcc64b265b36f6f67733')

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf ibm-semeru-open-jdk_x64_linux_8u${_pkgver_minor}b${_pkgver_build}_openj9-${_j9_version}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk8u${_pkgver_minor}-b${_pkgver_build}" "${pkgdir}/usr/lib/jvm/java-8-j9"
}
