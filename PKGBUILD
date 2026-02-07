# Maintainer: Louise <louise dot aur at mailbox dot org>

pkgname=lyra
pkgver=1.7.0
pkgdesc="A simple to use, composable, command line parser for C++ 11 and beyond"
pkgrel=1
arch=('any')
license=('BSL-1.0')
source=("https://github.com/bfgroup/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('e3da338e0855e1f0fb6e8f88c2f1357a7bb00017018428f9c112b42217d4ee8350df211515d75e2836315c1fe36cc1e7f6f10035d170afec1f1c3994a7de73cf')
makedepends=('cmake')

build() {
    cd Lyra-${pkgver}
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd Lyra-${pkgver}
    make DESTDIR="${pkgdir}" install
}
