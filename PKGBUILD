
# Maintainer: Jack Johannesen <jack AT insertdomain DOT name>

pkgname="freshfetch-bin"
pkgver=0.2.0
pkgrel=2
pkgdesc="A fresh take on Neofetch"
arch=('x86_64')
url="https://github.com/K4rakara/freshfetch"
license=('MIT')
depends=()
makedepends=()
optdepends=('xorg-xrandr' 'xorg-xwininfo')
provides=('freshfetch')
conflicts=('freshfetch-git' 'freshfetch')
source=("https://github.com/K4rakara/${pkgname//-bin}/releases/download/v$pkgver/freshfetch.tar.gz"
        "https://raw.githubusercontent.com/K4rakara/${pkgname//-bin}/master/LICENSE.md")
md5sums=('b54ca36f991955c9a97e825bbcb7090a'
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

