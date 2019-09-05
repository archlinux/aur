# Maintainer: Corey Bruce <cdfrosty@gmail.com>

pkgname=gamerworld
_pkgname=GamerWorld-linux-x64
pkgver=1.1.3
pkgrel=5
pkgdesc="Play games all in one place"
arch=('x86_64')
url="https://gitlab.com/gamerworld/application"
license=('GPL')
depends=()
makedepends=( )
provides=('gamerworld')
conflicts=()
source=("https://gitlab.com/gamerworld/application/raw/Binaries/GamerWorld-linux-x64.tar.gz")

md5sums=("SKIP")

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p $pkgdir/opt/GamerWorld/
  # Exec bit
  chmod 755 "$pkgdir/opt/GamerWorld/"
    cp -r ./ $pkgdir/opt/GamerWorld/
 
# Desktop Entry
  install -Dm 644 "${pkgdir}/opt/GamerWorld/GamerWorld.desktop" "${pkgdir}/usr/share/applications/GamerWorld.desktop"
  sed -i s%/usr/share%/opt% ${pkgdir}/usr/share/applications/GamerWorld.desktop
}
