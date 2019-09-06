# Maintainer: Corey Bruce <cdfrosty@gmail.com>

pkgname=googleplaymusic
_pkgname=GooglePlayMusic-linux-x64
pkgver=1.1.5
pkgrel=4
pkgdesc="Google Play Music is a unofficial client to play your music."
arch=('x86_64')
url="https://gitlab.com/coreybruce/GooglePlayMusic"
license=('GPL')
depends=()
makedepends=( )
provides=('googleplaymusic')
conflicts=()
source=("https://gitlab.com/coreybruce/GooglePlayMusic/raw/binaries/GooglePlayMusic-linux-x64.tar.gz")

md5sums=("SKIP")

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p $pkgdir/opt/GooglePlayMusic/
  # Exec bit
  chmod 755 "$pkgdir/opt/GooglePlayMusic/"
    cp -r ./ $pkgdir/opt/GooglePlayMusic/

# Desktop Entry
  install -Dm 644 "${pkgdir}/opt/GooglePlayMusic/GooglePlayMusic.desktop" "${pkgdir}/usr/share/applications/GooglePlayMusic.desktop"
  sed -i s%/usr/share%/opt% ${pkgdir}/usr/share/applications/GooglePlayMusic.desktop
}
