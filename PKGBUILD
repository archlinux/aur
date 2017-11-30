# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=interception-caps2esc
pkgver=0.1.1
pkgrel=1
pkgdesc='caps2esc: transforming the most useless key ever in the most useful one'
arch=('i686' 'x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/caps2esc'
depends=('interception-tools')
makedepends=('cmake' 'gcc')
conflicts=('caps2esc')
source=("https://gitlab.com/interception/linux/plugins/caps2esc/repository/archive.tar.gz?ref=v${pkgver}")
md5sums=('71d77f1fe4211dd33d4713770d5615be')

build() {
    cd ${srcdir}/caps2esc-v${pkgver}-*
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd ${srcdir}/caps2esc-v${pkgver}-*

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 444 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"

    make install
}
