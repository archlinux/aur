# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=osu-wine-git
pkgver=1.0.r1.gc36d24f
pkgrel=1
pkgdesc="osu!"
arch=('any')
url="https://github.com/Nefelim4ag/osu-wine"
license=('GPL3')
depends=('wine' 'winetricks' 'bash' 'lib32-gnutls' 'wget')
optdepends=('lib32-libpulse: for audio' 'wine-staging')
#conflicts=()
source=("$pkgname"::'git://github.com/Nefelim4ag/osu-wine.git#branch=master')
md5sums=('SKIP')
install=$pkgname.install
backup=("etc/osu-wine.conf")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname}/"
    make install PREFIX="$pkgdir"
}
