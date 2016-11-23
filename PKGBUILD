# Maintainer: PenguinSnail

pkgname=quick-back
pkgver=3.0.1
pkgrel=1
pkgdesc="Quick, simple command line backup tool"
arch=('any')
url="https://github.com/PenguinSnail/Quick-Back"
license=('GPL3')
depends=('rsync')
makedepends=() 
optdepends=('arch-install-scripts: Repair backed-up fstab *experimental')
provides=('quick-back')
conflicts=('quick-back-git')
options=()
source=('https://github.com/PenguinSnail/Quick-Back/archive/'$pkgver'.tar.gz')
md5sums=('SKIP')

_gitname='Quick-Back'

pkgver() {
echo $pkgver
   }

package() {
	install -D -m 755 $srcdir/${_gitname}-${pkgver}/quick-back $pkgdir/usr/bin/quick-back
	gzip -c $srcdir/${_gitname}-${pkgver}/MANPAGE > $srcdir/${_gitname}-${pkgver}/quick-back.8.gz
	install -D -m 755 $srcdir/${_gitname}-${pkgver}/quick-back.8.gz $pkgdir/usr/share/man/man8/quick-back.8.gz
}

