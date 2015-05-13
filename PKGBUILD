# Contributor: Peter Baldwin <bald_pete@hotmail.com>
# Contributor (modifications): Bruno Tsubouchi Yporti <brunoyporti@gmail.com>
# Contributor (modifications): Igor Nemilentsev <trezorg@gmail.com>
# For Lexmark Z601, Lexmark Z602, Lexmark Z604, Lexmark Z605, Lexmark Z615, and Dell 720
# Partial suport in others printers (e.g. Lexmark X1250)

pkgname=z600
pkgver=1.0
pkgrel=3
pkgdesc="Lexmark Z600 Printer Driver"
arch=('i686' 'x86_64')
url="http://www.lexmark.com/"
license=('custom')
makedepends=('rpmextract' 'gzip')
depends_i686=('cups' 'libstdc++5')
depends_x86_64=('cups' 'lib32-libcups' 'lib32-libstdc++5')
source=("http://downloads.lexmark.com/downloads/cpd/CJLZ600LE-CUPS-1.0-1.TAR.gz")
md5sums=('c0e35c9819b25e587e75a5a743c49f18')


build() {
  cd $srcdir
  tar xf CJLZ600LE-CUPS-1.0-1.TAR.gz
  tail -n +143 z600cups-1.0-1.gz.sh > install.tar.gz
  tar xf install.tar.gz
  rpmextract.sh z600llpddk-2.0-1.i386.rpm
  rpmextract.sh z600cups-1.0-1.i386.rpm
}

package() {
  cd $srcdir/
  mv -f usr $pkgdir
}
