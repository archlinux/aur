# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Jakob Nixdorf <jakob.nixdorf@online.de>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>

pkgname=childsplay
pkgver=3.3
pkgrel=1
pkgdesc="A suite of educational games for young children"
arch=('i686' 'x86_64')
url="http://www.childsplay.mobi"
license=('GPL')
depends=('python2-pygame' 'pygtk' 'python2-sqlalchemy' 'python2-numpy')
optdepends=('childsplay-alphabet-sounds')
install=childsplay.install
conflicts=(childsplay-git)
source=(http://download.savannah.gnu.org/releases/childsplay/$pkgname-$pkgver.tgz
        childsplay.desktop childsplay)
sha256sums=('3dcbdef8721505add5a811f504a655934ba91d4bc85a0b6ded930f447ebc3a07'
            '84414248cb8b55d73569414884ef2cbd8c10f3ddf7803d10f912a2f3fcf42e5f'
            '4447c9d21714d7e2c99075ec249c99dfecfc502505d91485561798801601d04b')

package() {
  cd $srcdir

  mkdir -p "$pkgdir/usr/share/games/" 
  mkdir -p "$pkgdir/usr/bin/"
  cp -R "$pkgname-$pkgver" "$pkgdir/usr/share/games/$pkgname"

  install -D -m755 "$srcdir/childsplay" "$pkgdir/usr/bin/childsplay"
  install -D -m644 "$srcdir/childsplay.desktop" \
                   "$pkgdir/usr/share/applications/childsplay.desktop"
  install -D -m644 "$pkgname-$pkgver/lib/SPData/themes/childsplay/logo_cp_32x32.xpm" \
                   "$pkgdir/usr/share/pixmaps/childsplay.xpm"
}

# vim:set ts=2 sw=2 et:
