# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=leagueoflegends-git
pkgver=0.13.r25.g0b05e62
pkgrel=1
pkgdesc="League Of Legends: Install/Run wrapper"
arch=('any')
url="https://github.com/Nefelim4ag/League-Of-Legends"
license=('GPL3')
depends=('wine' 'winetricks' 'bash' 'lib32-gnutls' 'lib32-libldap'
         'lib32-openal' 'lib32-libpulse' 'wget')
conflicts=('leagueoflegends')
source=("$pkgname"::'git+https://github.com/Nefelim4ag/League-Of-Legends.git#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    make install PREFIX="$pkgdir"
}
