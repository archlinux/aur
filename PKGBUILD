# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=interception-hideaway
pkgver=0.1.0
pkgrel=1
pkgdesc='hideaway: a Interception Tools plugin to hide your mouse pointer'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/hideaway'
depends=('interception-tools')
makedepends=('cmake' 'gcc')
source=("https://gitlab.com/interception/linux/plugins/hideaway/repository/archive.tar.gz?ref=v${pkgver}")
md5sums=('48ef1c714f6239fac5af2a7d30f38f56')

build() {
    cd ${srcdir}/hideaway-v${pkgver}-*
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd ${srcdir}/hideaway-v${pkgver}-*

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 444 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"

    make install
}
