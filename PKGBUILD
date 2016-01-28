# Contributor: max.bra <max.bra at alice dot it>
# Contributor: Marius Nestor <marius at softpedia dot com>
# Contributor: mathewv <mathewvq at gmail dot com>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgname=gnome-exe-thumbnailer
pkgver=0.9.3
pkgrel=2
_pkgintver=0ubuntu1
pkgdesc="Wine .exe and other executable thumbnailer for GNOME"
arch=('any')
url="https://launchpad.net/ubuntu/+source/gnome-exe-thumbnailer"
license=('LGPL2.1')
depends=('imagemagick' 'icoutils' 'glib2')
makedepends=()
optdepends=('wine: support .msi installer version and .lnk shortcuts')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-$_pkgintver.tar.gz)
md5sums=('f11c0c897b670cc1504c8fc31e1aa055')

package() {
  install -D -m755 "$srcdir"/$pkgname-$pkgver/usr/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/$pkgname-$pkgver/usr/share/thumbnailers/exe-dll-msi.thumbnailer "$pkgdir"/usr/share/thumbnailers/exe-dll-msi.thumbnailer
  install -dD -m755 "$pkgdir"/usr/share/pixmaps/$pkgname
  cp -r "$srcdir"/$pkgname-$pkgver/usr/share/pixmaps/$pkgname/* "$pkgdir"/usr/share/pixmaps/$pkgname
}
