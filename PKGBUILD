# Maintainer: Rod Kay <charlie5 @ #ada on freenode irc>

pkgname='quex-for_libadalang'
pkgver=0.65.4
pkgrel=2
pkgdesc="Generator of lexical analyzers in C and C++. Unicode Supported."

arch=('any')
url="http://quex.org/"
license=('LGPL')
provides=('quex')
depends=('python2')

source=("https://sourceforge.net/projects/quex/files/HISTORY/0.65/quex-0.65.4.tar.gz")
md5sums=('9a834c9cae85773cd5b78b737ecef0b2')


package()
{
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/bin"

  cp -fr quex-0.65.4 "$pkgdir/usr/lib"

  export QUEX_PATH=/usr/lib/quex-0.65.4

  # Install profile.d script to set QUEX_PATH.
  #
  mkdir -p "${pkgdir}"/etc/profile.d
  echo "export QUEX_PATH=/usr/lib/quex-0.65.4" > "${pkgdir}"/etc/profile.d/quex.sh

  ln -s $pkgdir/usr/lib/quex-0.65.4/quex-exe.py $pkgdir/usr/bin/quex

  chmod a+rx $pkgdir/usr/lib/quex-0.65.4/quex-exe.py
  chmod a+rx $pkgdir/usr/bin/quex
}
