# Maintainer: Lari Tikkanen <lartza@outlook.com>
# Contributor: Miguel Peláez <kernelfreeze@outlook.com>
# Contributor: WFCody
# Contributor: milgner
# Contributor: alkalien

pkgname=jdk8-openj9-bin
pkgrel=1
_pkgver_minor=504
_pkgver_patch=5
pkgver=8.0.${_pkgver_minor}.${_pkgver_patch}
pkgdesc="IBM Semeru OpenJ9 with openjdk8"
arch=('x86_64')
url="https://developer.ibm.com/languages/java/semeru-runtimes/"
license=('GPL-2.0-only WITH Classpath-exception-2.0')
depends=('java-runtime-common' 'java-environment-common' 'ca-certificates-utils' 'nss')
replaces=('jdk8-j9-bin')

provides=(
'java-environment=8'
'java-runtime=8'
'java-runtime-headless=8'
)

makedepends=('coreutils' 'bash')
source=("https://github.com/ibmruntimes/semeru8-binaries/releases/download/jdk-${pkgver}/ibm-semeru-open-jdk_x64_linux_${pkgver}.tar.gz")
noextract=("ibm-semeru-open-jdk_x64_linux_${pkgver}.tar.gz")

sha256sums=('212b7d085e5deacaeb455d661c1205b38d1751e194c3355dd90214cf7fb177d5')

package() {
    cd "$srcdir"
    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf ibm-semeru-open-jdk_x64_linux_${pkgver}.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk-8.0.${_pkgver_minor}.${_pkgver_patch}" "${pkgdir}/usr/lib/jvm/java-8-j9"
}
