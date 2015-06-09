# Maintainer: marazmista <marazmista@gmail.com>

pkgname=tar-backup-git
pkgver=20140128
pkgrel=1
pkgdesc="Tar backup tool"
url="http://github.com/marazmista/tar-backup"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('tar' 'openssl' 'qt4')
provides=('tar-backup')
replaces=('tar-backup')
source=('git://github.com/marazmista/tar-backup.git')
sha256sums=('SKIP')
 
build() {
mkdir -p build
cd build
qmake-qt4 "../tar-backup/tar-backup/"
make
}
 
package() {
cd build
make prefix="${pkgdir}" install

install -Dm644 "$srcdir/build/tar-backup" "$pkgdir/usr/bin/tar-backup"
chmod +x "$pkgdir/usr/bin/tar-backup"
}