# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=leagueoflegends-git
pkgver=v0.9.22.r0.g0497181
pkgrel=1
pkgdesc="League of Legends helper script"
arch=('any')
url="https://github.com/kyechou/leagueoflegends"
license=('GPL3')
depends=('wine-lol' 'winetricks' 'bash' 'lib32-gnutls' 'lib32-libldap'
         'lib32-openal' 'lib32-libpulse' 'wget')
conflicts=('leagueoflegends')
source=("$pkgname"::'git+https://github.com/kyechou/leagueoflegends.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    make install PREFIX="$pkgdir"
}
