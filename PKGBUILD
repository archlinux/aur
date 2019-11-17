# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=open-jardin-bin
pkgver=1.07
pkgrel=1
pkgdesc="A garden management"
arch=('x86_64')
url="https://openjardin.eu/"
license=('GPL3')
depends=('xdg-utils')
source=("https://openjardin.eu/download/openjardin_${pkgver}_amd64.deb"
	$pkgname.desktop
        $pkgname.png)

package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  rm $pkgdir/usr/share/openjardin/champ.png
  rm $pkgdir/usr/share/applications/*.desktop
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
sha256sums=('029198c6843ad868556c67a2812e296295215e06e05644757f18e984283bd107'
            'c042b43e1853e149a29bd046e5955da44c493377f0639e9e402958762615072e'
            '3045e5b350c7bf1510eaab2993bbf21e011cb0876ae0dda3e8e28f0528f0bd3f')
