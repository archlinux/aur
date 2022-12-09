# Maintainer: Setsuna Watanabe <settyness at gmail dot com>
# Contributor: Liu Yuyang <lhtlyy at googlemail dot com>

pkgname=gimp-plugin-beautify
pkgver=0.5.3
pkgrel=1
pkgdesc="GIMP Beautify is a set of GIMP plug-ins for quickly and easily beautifying photos."
arch=('i686' 'x86_64')
url="https://github.com/hejiann/beautify"
license=('GPL3')
depends=('gimp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hejiann/beautify/archive/v$pkgver.tar.gz")
md5sums=('48a90327c487093df19654f4ab95e4d5')

build() {
  cd "beautify-$pkgver"
  make
}

package() {
 cd "beautify-$pkgver"
 install -Dm755 beautify "$pkgdir/usr/lib/gimp/2.0/plug-ins/beautify" 
 install -Dm755 skin-whitening "$pkgdir/usr/lib/gimp/2.0/plug-ins/skin-whitening" 
 install -Dm755 simple-border "$pkgdir/usr/lib/gimp/2.0/plug-ins/simple-border" 
 install -Dm755 border "$pkgdir/usr/lib/gimp/2.0/plug-ins/border" 
}