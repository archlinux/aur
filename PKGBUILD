
# Maintainer: Jack Johannesen <jack AT insertdomain DOT name>

pkgname="freshfetch-bin"
pkgver=0.1.2
pkgrel=1
pkgdesc="A fresh take on Neofetch"
arch=('any')
url="https://github.com/K4rakara/freshfetch"
license=('MIT')
depends=()
makedepends=()
optdepends=('xorg-xrandr' 'xorg-xwininfo')
provides=('freshfetch')
conflicts=('freshfetch-git' 'freshfetch')
source=("https://github.com/K4rakara/${pkgname//-bin}/releases/download/v$pkgver/freshfetch.tar.gz"
        "https://raw.githubusercontent.com/K4rakara/${pkgname//-bin}/master/LICENSE.md")
md5sums=('6c7c4073911fbf9e1d83539ec072f51a'
         'a4c191c500e67564935777e1abaebbab')
noextract=('freshfetch.tar.gz')

package() {
  cd $pkgdir;
  tar -xzvf $srcdir/../freshfetch.tar.gz;
  chown root:root ./usr/bin/freshfetch;
  install \
    -Dm644 \
    $srcdir/../LICENSE.md \
    ./usr/share/licenses/$pkgname/LICENSE;
}

