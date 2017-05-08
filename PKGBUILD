# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Fabio Loli <loli_fabio@protonmail.com>

_pkgname=Neobarok
pkgname=${_pkgname,,}
pkgver=1.1.3
pkgrel=1
pkgdesc="3D modeling software aimed at artists and users of all levels"
arch=('x86_64')
url="http://$pkgname.com"
license=('custom')
depends=('qt5-base' 'sfml')
source=("http://$pkgname.com/$_pkgname-$pkgver-linux.zip"
        "$pkgname.desktop"
        "$pkgname.svg")
md5sums=('3ef845089a3db23791831043b756d1de'
         'df208ac115e907a556a7315156816fdc'
         '9e447434129fae9d99eeada08ac7d1f3')

package() {
  install -dm755 $pkgdir/opt
  cp -r $_pkgname $pkgdir/opt
  
  install -Dm644 $pkgname.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  
  install -dm755 $pkgdir/usr/bin
  ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$pkgname
  ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname
  install -dm755 $pkgdir/usr/lib
  ln -s /usr/lib/libsfml-window.so.2.4 "${pkgdir}"/usr/lib/libsfml-window.so.2.3
}
