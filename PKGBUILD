# Maintainer: bergentroll <bergentroll@insiberia.net>

pkgname=goldendict-enruen-content
pkgver=1.1
pkgrel=1
pkgdesc="English-Russian-English dictionaries for Goldendict with pronounces"
license=('GPL2')
install=$pkgname.install
optdepends=(
'goldendict: for using this dictionary',
'goldendict-gt5-git: for using this dictionary'
)
url='http://www.goldendict.org'
source=("http://downloads.sourceforge.net/goldendict/enruen-content-$pkgver.tar.bz2")
md5sums=('4db1fd87067c603750c2f2741b90a359')
arch=(any)

package() {
  TARGET='/usr/share/goldendict/'
  mkdir -p $pkgdir$TARGET
  cp -r $srcdir/content/ $pkgdir$TARGET
  find $pkgdir${TARGET}content/ -type d -exec chmod 755 {} \+
  find $pkgdir${TARGET}content/ -type f -exec chmod 644 {} \+
}
