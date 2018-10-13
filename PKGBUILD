# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>

_pkgname=Neobarok
pkgname=${_pkgname,,}
pkgver=1.1.3
pkgrel=5
pkgdesc="3D modeling software aimed at artists and users of all levels"
arch=(x86_64)
url="http://$pkgname.com"
license=(custom)
depends=(qt5-base sfml hicolor-icon-theme)
makedepends=(chrpath)
source_x86_64=("http://$pkgname.com/$_pkgname-$pkgver-linux.zip")
source=("$pkgname.desktop"
        "$pkgname.svg"
        "$pkgname-LICENSE")
sha256sums=('c64183c30d535413bd8200cf531d397a492dd92be51b83f88baebaed7ab04690'
            '98e10205466e493ea7567abd2ca8c7abfe73a4a076dc4b3e69c6a22abfa2297b'
            'bb75d084b907f97e4b53d8f9c74e06113d90a67d2c33e8aa3fc7a18efaafe0a5')
sha256sums_x86_64=('3be3f16ac588d8ff7e358c123aad2c22bd3e3a107bda46bcc19ceabda5d0bc97')

package() {
  install -Dm755 ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/share/${pkgname}/${pkgname}
  install -Dm644 $pkgname.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  chrpath --delete ${pkgdir}/usr/share/${pkgname}/${pkgname}

  install -dm755 $pkgdir/usr/bin
  ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/$pkgname

  install -dm755 $pkgdir/usr/lib
  ln -s /usr/lib/libsfml-window.so ${pkgdir}/usr/lib/libsfml-window.so.2.3
}
