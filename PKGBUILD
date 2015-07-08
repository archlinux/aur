# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Jakob Nixdorf <jakob.nixdorf@online.de>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>

pkgname=childsplay
pkgver=2.6.5
pkgrel=2
pkgdesc="A suite of educational games for young children"
arch=('i686' 'x86_64')
url="http://www.childsplay.mobi"
license=('GPL')
depends=('python2-pygame' 'pygtk' 'python2-sqlalchemy' 'python2-numpy')
optdepends=('childsplay-alphabet-sounds')
install=childsplay.install
source=(http://download.savannah.gnu.org/releases/childsplay/$pkgname-$pkgver.tgz
        childsplay.desktop childsplay)
sha256sums=('16b232db3e1806e37748ecf563523cfd7da78fe6b86a625c63e58993b73ca88a'
            '84414248cb8b55d73569414884ef2cbd8c10f3ddf7803d10f912a2f3fcf42e5f'
            '487b8649729b3d8fae8c7d8fb2f76450abf516354e6b4c0d7bf280332ff8f1b1')

package() {
  cd $srcdir

  mkdir -p "$pkgdir/usr/local/games/" 
  mkdir -p "$pkgdir/usr/bin/"
  cp -R "$pkgname-$pkgver" "$pkgdir/usr/local/games/$pkgname"

  install -D -m755 "$srcdir/childsplay" "$pkgdir/usr/local/games/$pkgname/childsplay"
  install -D -m644 "$srcdir/childsplay.desktop" \
                   "$pkgdir/usr/share/applications/childsplay.desktop"
  install -D -m644 "$pkgname-$pkgver/lib/SPData/themes/childsplay/logo_cp_32x32.xpm" \
                   "$pkgdir/usr/share/pixmaps/childsplay.xpm"
}

# vim:set ts=2 sw=2 et:
