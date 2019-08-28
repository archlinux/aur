# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=exe-thumbnailer
pkgver=0.10.1
pkgrel=1
pkgdesc="Thumbnailer for .exe/.dll/.msi/.lnk files"
arch=('any')
url="https://github.com/exe-thumbnailer/exe-thumbnailer"
license=('LGPL2.1')
depends=('bash' 'imagemagick' 'icoutils' 'glib2')
optdepends=('wine: to support .lnk shortcuts'
            'liblnk-tools: to support .lnk shortcuts'
            'msitools: to support .msi installers')
replaces=("gnome-$pkgname")
conflicts=("gnome-$pkgname")
source=($pkgname-$pkgver.tar.gz::"https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('52a48d8e94009453f3506d33eefca9a6551ec94ac1580dc3129c1139e719c782')

package() {
  cd $pkgname-$pkgver

  install -Dm0755 usr/bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -Dm0644 usr/share/thumbnailers/exe-dll-msi.thumbnailer \
    "$pkgdir"/usr/share/thumbnailers/exe-dll-msi.thumbnailer

  install -Dm0644 $pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1

  install -d "$pkgdir"/usr/share/pixmaps
  cp -r usr/share/pixmaps/$pkgname "$pkgdir"/usr/share/pixmaps

  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -Dm0644 CHANGELOG.* README.md "$pkgdir"/usr/share/doc/$pkgname
}
