# Maintainer: Liganic <liganic-aur@gmx.net>
pkgname=cpplint
pkgver=10
pkgrel=0
pkgdesc="Automated checker to make sure a C++ file follows Google's C++ style guide."
arch=('i686' 'x86_64')
url="https://google.github.io/styleguide/cppguide.html"
license=('unknown')
groups=()
depends=('python2')
source=('https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py'
'https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/README')
sha256sums=('7d84109c443030ae33978322469c3b82c40f52e654f2759b356c3f071fe0e749'
            '3a6ce0d4007b6d3dac0925ecf2c5f40e9f8ab50dfcc1fd1caad349b5e8ba7a40')

build() {
  sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/' $srcdir/cpplint.py
}

package() {
  install -Dm755 "$srcdir/cpplint.py" "$pkgdir/usr/bin/cpplint"
  install -Dm755 "$srcdir/README" "$pkgdir/usr/share/doc/cpplint/README"
}

# vim:set ts=2 sw=2 et:
