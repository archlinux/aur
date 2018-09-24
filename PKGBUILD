# $Id: PKGBUILD 266875 2018-09-24 16:32:42 GingerTechnology $
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=netselect
pkgver=0.4
pkgrel=4
pkgdesc="An ultrafast intelligent parallelizing binary-search implementation of ping"
arch=('x86_64')
url="http://alumnit.ca/~apenwarr/netselect/index.html"
license=('custom')
depends=('glibc')
source=("https://github.com/apenwarr/netselect/archive/$pkgname-$pkgver.tar.gz"
        "license.txt")
md5sums=('84a52e175a87a89929e0f99ca23fef49'
         '741ea171051c5cbac5ff18326c11d65e')

build() {
  mv "$srcdir/netselect-netselect-0.4" "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"

  sed -i '/sudo /d' Makefile

  make
}

package() {

  install -D -m4755 "$srcdir/$pkgname/netselect" "$pkgdir"/usr/bin/netselect
  install -D -m644  "$srcdir"/license.txt \
    "$pkgdir"/usr/share/licenses/netselect/LICENSE
}
