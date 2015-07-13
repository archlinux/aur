# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: carukia < hornetsnest0 at gmail dot com >
# Contributor: Thomas Krug < phragment at lavabit dot com >

pkgname="pidgin-awayonlock"
pkgver="0.6"
pkgrel="1"
pkgdesc="A simple plugin for Pidgin to change your status when the screensaver gets activated."
arch=("i686" "x86_64")
url="http://costela.net/projects/awayonlock/"
license=("GPL3")
depends=("libpurple")
optdepends=(
    "gnome-screensaver: gnome support"
    "kdeartwork-kscreensaver: kde support"
    "mate-screensaver: mate support"
)
makedepends=("cmake")
source=("https://github.com/costela/awayonlock/archive/v${pkgver}.tar.gz")
sha256sums=('2d321221b254cc577f14ab9391b4cd98925a0f3f5bd56e33fe62b2868bb5d03a')

package() {
    cd "${srcdir}/awayonlock-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr/ ./
    make
    make DESTDIR="${pkgdir}" install
}
