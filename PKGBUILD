# Maintainer: suliman altassan <suliman.p2019@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=webui
pkgver=1.0.20
pkgrel=1
pkgdesc="Open source project to use web browsers as UI."
arch=('x86_64')
url="https://github.com/alifcommunity/webui/"
license=('LGPL3')
depends=('boost-libs')
makedepends=(git cmake boost)
_commit=db0a6b62de77913a9bb1e1137c557d46a1850a43
source=("git+https://github.com/alifcommunity/webui.git#commit=${_commit}")
#source=("git+https://github.com/alifcommunity/webui.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="${pkgdir}" install
}
