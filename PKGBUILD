# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=debhelper-sphinx
pkgver=3.2.1
_debpkgrel=1
pkgrel=1
pkgdesc="debhelper scripts for sphinx docs: sphinxdoc.pm"
arch=("any")
url="https://packages.debian.org/sid/all/sphinx-common"
license=('BSD')
source=("https://deb.debian.org/debian/pool/main/s/sphinx/sphinx-common_${pkgver}-${_debpkgrel}_all.deb")
sha512sums=('f7e56c3131746629accdfc002b42f92e140b086188abeaebb064165d1024507fd0a3c688246f256f658fa438eaec817384f0054b1832737f0d340b16619dd1c3')

prepare() {
  cd "$srcdir"
  tar -xf data.tar.xz
}

package() {
  install -Dm644 "$srcdir"/usr/share/perl5/Debian/Debhelper/Sequence/sphinxdoc.pm \
      "$pkgdir"/usr/share/perl5/vendor_perl/Debian/Debhelper/Sequence/sphinxdoc.pm

  install -Dm644 "$srcdir"/usr/share/doc/sphinx-common/copyright \
      "$pkgdir"/usr/share/licenses/$pkgname/copyright
}
