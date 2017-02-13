# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=osu-wine-git
pkgver=6.04b1941
pkgrel=2
pkgdesc="osu!"
arch=('any')
url="https://github.com/Nefelim4ag/osu-wine"
license=('GPL3')
depends=('wine' 'winetricks' 'bash' 'lib32-gnutls')
optdepends=('lib32-libpulse: for audio' 'wine-staging')
#conflicts=()
source=("$pkgname"::'git://github.com/Nefelim4ag/osu-wine.git#branch=master')
md5sums=('SKIP')
install=$pkgname.install
backup=("etc/osu-wine.conf")

pkgver() {
    cd ${pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/${pkgname}/"
    ./install.sh PREFIX="$pkgdir"
}
