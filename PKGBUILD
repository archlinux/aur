# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=tremulous-data
pkgver=1.1.0
pkgrel=2
pkgdesc='Shared data files for Tremulous'
arch=('any')
url='http://tremulous.net/'
license=('GPL')
source=("http://downloads.sourceforge.net/tremulous/tremulous-$pkgver.zip")
md5sums=('3df5f7565571fb9524656308347bce1b')

prepare() {
  # Remove unneeded files from game directory
  rm tremulous/{CC,COPYING,ChangeLog,GPL,tremulous.{exe,x86,xpm},tremded.x86}

  # Remove the sources
  rm tremulous/tremulous-$pkgver-src.tar.gz
}

package() {
  # Install game data
  install -dm755 $pkgdir/opt/
  cp -r tremulous/ $pkgdir/opt/
  find $pkgdir -type f -exec chmod 644 {} +
}
