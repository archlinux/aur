# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: carukia < hornetsnest0 at gmail dot com >
# Contributor: Thomas Krug < phragment at lavabit dot com >

pkgname="pidgin-awayonlock"
pkgver="0.5.2"
pkgrel="3"
pkgdesc="A simple plugin for Pidgin to change your status when the screensaver gets activated."
arch=("i686" "x86_64")
url="http://costela.net/projects/awayonlock/"
license=("GPL3")
depends=("pidgin")
optdepends=(
    "gnome-screensaver: gnome support"
    "kdeartwork-kscreensaver: kde support"
)
makedepends=("cmake")
source=("https://github.com/costela/awayonlock/archive/v${pkgver}.tar.gz")
sha256sums=("40b25b72a310304e5dbbc1dfd26b87129b3a305a447312dc494731c72af72bb9")

package() {
    cd "${srcdir}/awayonlock-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr/ ./
    make
    make DESTDIR="${pkgdir}" install
}
