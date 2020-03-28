# Maintainer: Yurii Kolesnykov <root@yuikoles.com>
# Contributor: Bailey Kasin <bailey@gingertechnology.net>

pkgname=libdtrace-ctf
pkgver=1.1.0
pkgrel=5
pkgdesc="libdtrace-ctf is the Compact Type Format library used by DTrace on Linux"
arch=('x86_64')
url="https://github.com/oracle/libdtrace-ctf/"
license=('UPL')
makedepends=(
        'elfutils'
        'zlib'
)

source=("https://github.com/oracle/libdtrace-ctf/archive/${pkgver}.tar.gz")
md5sums=('6e07a4982a82e1799d467069a83e8c3b')

build() {
        cd "${pkgname}-${pkgver}"

	make
}

package() {
        cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
        mv "${pkgdir}"/usr/lib64 "${pkgdir}"/usr/lib
}
