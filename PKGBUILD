# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=debhelper-sphinx
pkgver=1.8.5
_debpkgrel=1
pkgrel=1
pkgdesc="debhelper scripts for sphinx docs: sphinxdoc.pm"
arch=("any")
url="https://packages.debian.org/sid/all/sphinx-common"
license=('BSD')
source=("https://deb.debian.org/debian/pool/main/s/sphinx/sphinx-common_${pkgver}-${_debpkgrel}_all.deb")
sha512sums=('ee41c69b6e38a94e3f98c26fb917d237d92fee5ec80ba38dd415bdb880b2ced70b37fb3ac5bda4c817263390ddd2b430360a06ac901252e79463b46a81190359')

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
