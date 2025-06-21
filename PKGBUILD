# Maintainer:    mzwing <mzwing@mzwing.eu.org>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

_pkgname=cortex
pkgname=cortex.cpp-bin
pkgver=1.0.14
pkgrel=1
pkgdesc='Local AI API Platform'
arch=('x86_64')
url='https://github.com/menloresearch/cortex.cpp'
license=('Apache-2.0')
depends=('openmpi' 'glibc' 'gcc-libs')
makedepends=('tar')
provides=('cortex' 'cortex-server')
conflicts=('cortex.cpp' 'cortex.cpp-beta' 'cortex.cpp-nightly' 'cortex.cpp-git' 'cortex.cpp-beta-bin' 'cortex.cpp-nightly-bin')
source_x86_64=("${_pkgname}_${pkgver}_x86_64.deb::$url/releases/download/v$pkgver/${_pkgname}-${pkgver}-linux-amd64-network-installer.deb")
sha256sums_x86_64=('f9a685645f1fae82944947d644ec43767469213d2a2b7d78030c1b3b7c7edd8e')

prepare() {
    tar -Jxf data.tar.xz -C "${srcdir}"
}

package() {
    install -Dm755 "$srcdir"/usr/bin/cortex "$pkgdir"/usr/bin/cortex
    install -Dm755 "$srcdir"/usr/bin/cortex-server "$pkgdir"/usr/bin/cortex-server
}
