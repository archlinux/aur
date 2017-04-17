# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=steam-wine-git
pkgver=7.6d12f0e
pkgrel=1
pkgdesc="Steam with simple wine wrapper"
arch=('any')
url="https://github.com/Nefelim4ag/steam-wine"
license=('GPL3')
depends=('wine' 'winetricks' 'bash')
optdepends=('lib32-libpulse: for audio' 'wine-staging')
#conflicts=()
source=("$pkgname"::'git://github.com/Nefelim4ag/steam-wine.git#branch=master')
md5sums=('SKIP')
install=$pkgname.install
backup=("etc/steam-wine.conf")

pkgver() {
    cd ${pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/${pkgname}/"
    ./install.sh PREFIX="$pkgdir"
}
