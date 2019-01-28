# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=interception-caps2esc
pkgver=0.1.3
pkgrel=2
pkgdesc='caps2esc: transforming the most useless key ever in the most useful one'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/caps2esc'
depends=('interception-tools')
makedepends=('cmake' 'gcc')
conflicts=('caps2esc')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/plugins/caps2esc/repository/archive.tar.gz?ref=v${pkgver}")
md5sums=('014e1b3fcd7fd889aab876f22d550eb8')

build() {
    cd ${srcdir}/caps2esc-v${pkgver}-*
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/caps2esc-v${pkgver}-*/build

    make DESTDIR="$pkgdir/" install
}
