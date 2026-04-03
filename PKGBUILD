# Maintainer: Droidwalds <ksmn@gmail.com>
# Contributor: Gottox (https://github.com/Gottox)
pkgname="qemuconf"
pkgver="0.2.1"
pkgrel=1
pkgdesc="Utility to use qemu configuration files for VM"
arch=('x86_64')
url="https://github.com/Gottox/${pkgname}"
license=('MIT')
source=("${url}/archive/tags/v${pkgver}.tar.gz")
sha256sums=('e95c68de82af7624d8f5d15467c04828fc0f1b004efdf774923e7cdcea2a79e6')

depends=('glibc' 'qemu')
makedepends=('clang' 'make')

conflicts=("${pkgname}-git")

build() {
    cd "${pkgname}-tags-v${pkgver}"
    make CC="clang"
}

package() {
    cd "${srcdir}/${pkgname}-tags-v${pkgver}"
    make DESTDIR="${pkgdir}"\
        PREFIX="/usr"\
        ETCDIR="${pkgdir}/etc"\
        install
}
