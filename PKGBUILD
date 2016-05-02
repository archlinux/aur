# Maintainer: Liganic <liganic-aur@gmx.net>
pkgname=cpplint
pkgver=11
pkgrel=0
pkgdesc="Automated checker to make sure a C++ file follows Google's C++ style guide."
arch=('i686' 'x86_64')
url="https://google.github.io/styleguide/cppguide.html"
license=('unknown')
groups=()
depends=('python2')
source=('https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py'
'https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/README')
sha256sums=('21898350f6c9b293758e3a55c63ef5531dde1c0b468ff1ca4cc401f68004e9d0'
            'a2a49a15fc0db21a0c130e57fb5894954d81bc95962fc90be2e70d2daaa27d89')

build() {
  sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/' $srcdir/cpplint.py
}

package() {
  install -Dm755 "$srcdir/cpplint.py" "$pkgdir/usr/bin/cpplint"
  install -Dm755 "$srcdir/README" "$pkgdir/usr/share/doc/cpplint/README"
}

# vim:set ts=2 sw=2 et:
