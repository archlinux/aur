# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=barrier-bin
pkgver=2.3.3
pkgrel=1
pkgdesc="Open-source KVM software based on Synergy (GUI)"
arch=(x86_64)
url="https://github.com/debauchee/barrier"
license=("custom:GPL2WithOpenSSLException")
depends=(
    # Barrier core dependencies:
    curl
    avahi
    libx11
    libxrandr
    libxext
    libxinerama
    xorgproto
    libxtst
    libxi
    libsm
    libice
    openssl
)
makedepends=(
    cmake

    # Barrier GUI dependencies:
    qt5-base
    hicolor-icon-theme
)
provides=("barrier")
conflicts=("barrier")
options=(!emptydirs !makeflags !strip)
source=(
	https://github.com/dotiful/AUR/raw/master/barrier-bin/barrier-${pkgver}-${CARCH}.tar.gz
)
noextract=(barrier-${pkgver}-${CARCH}.tar.gz)

package() {
	tar -xf $srcdir/barrier-${pkgver}-${CARCH}.tar.gz -C $pkgdir --exclude=".*"
}

sha256sums=('53ef7899bc2e20fa706e5137d79eff98efa6de1173f380eb4cb6eb4f5a637769')
