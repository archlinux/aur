# Maintainer: Jonne Haß <me@mrzyx.de>

_codename="primo"
pkgname=jappix
pkgver=1.1.6
pkgrel=1
pkgdesc="Another way to think social networks!"
arch=('any')
url="http://jappix.org"
license=('AGPL')
depends=('php' 'php-gd')
install=jappix.install
source=("http://download.jappix.org/$pkgver/$pkgname-$pkgver-$_codename.tar.bz2")

build() {
  cd "$srcdir/$pkgname"
  
  rm -Rf ../store_contents
  mv store ../store_contents
  ln -s /var/lib/webapps/jappix store
}

package() {
  cd "$srcdir/$pkgname"
  
  install -Dm664 ../store_contents/index.html $pkgdir/var/lib/webapps/jappix/index.html
  install -d $pkgdir/usr/share/webapps/
  cp -Rv ./ $pkgdir/usr/share/webapps/jappix
}

# vim:set ts=2 sw=2 et:
sha256sums=('1be1c2f01a877a4175adcb92c7b24a1c7075800fe22d4f3b4c56c723b611032c')
