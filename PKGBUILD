# Maintainer: Liganic <liganic-aur@gmx.net>
pkgname=cpplint
pkgver=9
pkgrel=0
pkgdesc="Automated checker to make sure a C++ file follows Google's C++ style guide."
arch=('i686' 'x86_64')
url="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml"
license=('unknown')
groups=()
depends=('python2')
source=('https://google-styleguide.googlecode.com/svn/trunk/cpplint/cpplint.py'
'https://google-styleguide.googlecode.com/svn/trunk/cpplint/README')
sha256sums=('7d84109c443030ae33978322469c3b82c40f52e654f2759b356c3f071fe0e749'
            '1c0500c633b2161633abffccc942f8b18dddb04a9b099d40db09b959078044c8')

build() {
  sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/' $srcdir/cpplint.py
}

package() {
  install -Dm755 "$srcdir/cpplint.py" "$pkgdir/usr/bin/cpplint"
  install -Dm755 "$srcdir/README" "$pkgdir/usr/share/doc/cpplint/README"
}

# vim:set ts=2 sw=2 et:
