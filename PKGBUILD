# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=leagueoflegends-git
pkgver=102.f3061a5
pkgrel=3
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
    cd ${pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/${pkgname}/"
    ./install.sh PREFIX="$pkgdir"
}
