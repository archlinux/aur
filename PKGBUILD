# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=warframe-git
pkgver=1.0000
pkgrel=1
pkgdesc="Warframe: Install/Run wrapper"
arch=('any')
url="https://github.com/Nefelim4ag/warframe-wine"
license=('GPL3')
depends=('wine' 'winetricks' 'bash')
optdepends=('lib32-libpulse: for audio' 'wine-staging: can work better')
conflicts=('warframe')
source=("$pkgname"::'git://github.com/Nefelim4ag/warframe-wine.git#branch=master')
md5sums=('SKIP')
backup=("etc/warframe.conf")

pkgver() {
    cd ${pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/${pkgname}/"
    ./install.sh PREFIX="$pkgdir"
}
