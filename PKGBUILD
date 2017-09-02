# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=exe-thumbnailer
pkgver=0.10.0
pkgrel=1
pkgdesc="Thumbnailer for .exe/.dll/.msi/.lnk files"
arch=('any')
url="https://github.com/exe-thumbnailer/exe-thumbnailer"
license=('LGPL2.1')
depends=('bash' 'imagemagick' 'icoutils' 'glib2')
optdepends=('wine: to support .lnk shortcuts'
            'liblnk: to support .lnk shortcuts'
            'msitools: to support .msi installers')
replaces=("gnome-$pkgname")
conflicts=("gnome-$pkgname")
source=($pkgname-$pkgver.tar.gz::"https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b1f856d7e88ac5d99e3f6e65f0a230bd25d2a2b8f63dca73c53bf087f6d0a322')

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
