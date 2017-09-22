pkgname=jdk9-openj9-bin
_pkgver_minor="181"
pkgver=9.${_pkgver_minor}
pkgrel=1
pkgdesc="Eclipse (former IBM) OpenJ9 with openjdk9"
arch=('x86_64')
url="https://adoptopenjdk.net/index.html?variant=openjdk9-openj9"
license=('custom')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
'java-environment=9'
'java-runtime=9'
'java-runtime-headless=9'
)
makedepends=('coreutils' 'bash')
source=("jdk9-j9.tar.gz::https://github.com/AdoptOpenJDK/openjdk9-openj9-releases/releases/download/jdk-9%2B${_pkgver_minor}/OpenJDK9-OPENJ9_x64_Linux_jdk-${pkgver}.tar.gz")
noextract=('jdk9-j9.tar.gz')
sha256sums=('74c7656a1f538476fe01471255e2d2bae57dfbd36cc6ab3bccb9c98b486c1a48')

package() {
    cd "$srcdir"
    
    mkdir -p "${pkgdir}/usr/lib/jvm/"
    tar -xf jdk9-j9.tar.gz -C "${pkgdir}/usr/lib/jvm/"
    mv "${pkgdir}/usr/lib/jvm/jdk-9+${_pkgver_minor}" "${pkgdir}/usr/lib/jvm/java-9-j9"
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s "/usr/lib/jvm/java-9-j9/legal" "${pkgdir}/usr/share/licenses/java-9-j9"
    
}

