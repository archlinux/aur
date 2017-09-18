# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>

_pkgname=Neobarok
pkgname=${_pkgname,,}
pkgver=1.1.3
pkgrel=4
pkgdesc="3D modeling software aimed at artists and users of all levels"
arch=('x86_64')
url="http://$pkgname.com"
license=('custom')
depends=('qt5-base'
         'sfml'
         'hicolor-icon-theme')
makedepends=('chrpath')
source=("http://$pkgname.com/$_pkgname-$pkgver-linux.zip"
        "$pkgname.desktop"
        "$pkgname.svg"
        "LICENSE")
md5sums=('3ef845089a3db23791831043b756d1de'
         '9f69204a3353d6ca8ab16a0f8df5185e'
         '9e447434129fae9d99eeada08ac7d1f3'
         '136c9659ff19f3d47b08d8d1d124d370')

package() {
  install -Dm755 ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/share/${pkgname}/${pkgname}
  install -Dm644 $pkgname.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  chrpath --delete ${pkgdir}/usr/share/${pkgname}/${pkgname}

  install -dm755 $pkgdir/usr/bin
  ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/$pkgname

  install -dm755 $pkgdir/usr/lib
  ln -s /usr/lib/libsfml-window.so.2.4 ${pkgdir}/usr/lib/libsfml-window.so.2.3
}
