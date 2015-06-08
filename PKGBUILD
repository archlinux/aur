# Contributor: Philipp Robbel <robbel@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=svl
pkgver=1.5
pkgrel=1
pkgdesc="Small Vector Library"
arch=('i686' 'x86_64')
url="http://www.cs.cmu.edu/afs/cs/user/ajw/www/software/index.html"
depends=('glibc')
source=(http://www.cs.cmu.edu/~ajw/public/dist/$pkgname-$pkgver.tar.gz additions.patch)
md5sums=('53f231278d6e102e3698693e981ce039'
         '8192d595db34400c2898fc1e25a1f19e')

build() {
  cd $srcdir/$pkgname-$pkgver
  # my custom patch
  patch -p 1 < $srcdir/additions.patch
  
  make linux_RH 
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DEST=$pkgdir/usr install
}
