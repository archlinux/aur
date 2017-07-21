# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: Marius Nestor <marius at softpedia dot com>
# Contributor: mathewv <mathewvq at gmail dot com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=gnome-exe-thumbnailer
pkgver=0.9.5
pkgrel=1
pkgdesc="Wine executable (.exe/.msi/.dll/.lnk) thumbnailer for GNOME"
arch=('any')
url="https://github.com/gnome-exe-thumbnailer/gnome-exe-thumbnailer"
license=('LGPL2.1')
depends=('bash' 'imagemagick' 'icoutils' 'glib2')
optdepends=('wine: to support .lnk shortcuts'
            'msitools: to support .msi installers')
source=($pkgname-$pkgver.tar.gz::"https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('1b59acf7005bf42aca85a71b08a771dc5b74ce44dca1ef34972a876fb4212e2d')

package() {
  cd $pkgname-$pkgver

  install -Dm0755 usr/bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -Dm0644 usr/share/thumbnailers/exe-dll-msi.thumbnailer \
    "$pkgdir"/usr/share/thumbnailers/exe-dll-msi.thumbnailer

  install -d "$pkgdir"/usr/share/pixmaps
  cp -r usr/share/pixmaps/$pkgname "$pkgdir"/usr/share/pixmaps

  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -Dm0644 CHANGELOG README "$pkgdir"/usr/share/doc/$pkgname
}
