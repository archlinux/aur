# Maintainer: sardach <sardach@uwu.mx>
pkgname=bibisco
_pkgname='bibisco CE'
pkgver=2.1.0
pkgrel=1
pkgdesc="Novel writing software. Community Edition."
arch=('x86_64')
url="https://www.bibisco.com/"
license=('GPL3')
depends=('npm')
source=("git+https://github.com/andreafeccomandi/bibisco")
md5sums=('SKIP');
build() {
        cd "$srcdir"/bibisco/bibisco/app
        npm install
}
package() {
mkdir -p $pkgdir/usr/share/$pkgname
mkdir -p $pkgdir/usr/bin/
mv $srcdir/bibisco/bibisco/app/* $pkgdir/usr/share/$pkgname
echo '#!/bin/bash
cd /usr/share/bibisco/
npm start
' > $pkgdir/usr/bin/bibisco
chmod +x $pkgdir/usr/bin/bibisco
}





