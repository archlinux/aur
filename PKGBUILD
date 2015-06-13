# Maintainer: McLenin <mclenin at gooogles email>
pkgname=gutenflash
pkgver=0.8.5
pkgrel=1
pkgdesc="RSVP streaming text reader for python/gtk (speed reader)"
arch=(any)
url="http://toykeeper.net/programs/flash/"
license=('GPL2')
groups=()
depends=('gtk2' 'pygtk' 'python2')
source=("http://toykeeper.net/programs/flash/files/gutenflash-0.8.5.tar.gz"
"${pkgname}.xpm"
"${pkgname}.desktop"
)
noextract=()
md5sums=(
"2eb075caf9efc9eb79b7213048cf9660"
"4338f9ac2ed887cb17e6df1ab2864aed"
"6da8f3ac45cfbc9b8715a6688edd2a0c") 

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:' flash.py
 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  
  cd "$srcdir"
  
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${pkgname}.xpm  ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm
  
}