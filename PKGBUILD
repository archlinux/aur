# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=cadmus-deb
pkgver=0.0.3
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
sha256sums=('300b9e66e58e23400e59d36c2dc93647508d5c4685ce156c81ecb88140457f50')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/cadmus/cadmus "${pkgdir}/usr/bin/cadmus"
} 
