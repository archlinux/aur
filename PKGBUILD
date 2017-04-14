# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=leagueoflegends-git
pkgver=0.13.r10.g2c5d6ef
pkgrel=1
pkgdesc="League Of Legends: Install/Run wrapper"
arch=('any')
url="https://github.com/Nefelim4ag/League-Of-Legends"
license=('GPL3')
depends=('wine' 'winetricks' 'bash' 'lib32-gnutls' 'lib32-libldap' 'wget')
optdepends=('lib32-libpulse: for audio' 'wine-staging: can work better')
conflicts=('leagueoflegends')
source=("$pkgname"::'git://github.com/Nefelim4ag/League-Of-Legends.git#branch=master')
md5sums=('SKIP')
install=leagueoflegends-git.install
backup=("etc/leagueoflegends.conf")

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname}/"
    ./install.sh PREFIX="$pkgdir"
}
