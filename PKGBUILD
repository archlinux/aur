# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=cadmus-deb
pkgver=0.0.2
pkgrel=1
pkgdesc="A GUI frontend for @werman's Pulse Audio real-time noise suppression plugin"
arch=('x86_64')
url="https://github.com/josh-richardson/cadmus/"
license=('GPL3')
makedepends=('tar')
conflicts=('cadmus' 'cadmus-appimage')
provides=('cadmus')
depends=('hicolor-icon-theme' 'zlib')
source=(https://github.com/josh-richardson/cadmus/releases/download/${pkgver}/cadmus.deb)
sha256sums=('25a7b48c66a1395da66939a8c8b026eb775d4d10ada482d24b8ea2373376c864')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/cadmus/cadmus "${pkgdir}/usr/bin/cadmus"
} 
