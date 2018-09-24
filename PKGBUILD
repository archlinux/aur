# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=debhelper-sphinx
pkgver=1.7.9
_debpkgrel=1
pkgrel=1
pkgdesc="debhelper scripts for sphinx docs: sphinxdoc.pm"
arch=("any")
url="https://packages.debian.org/sid/all/sphinx-common"
license=('BSD')
source=("https://deb.debian.org/debian/pool/main/s/sphinx/sphinx-common_${pkgver}-${_debpkgrel}_all.deb")
sha512sums=('52859671981c154f0a151aca0a6a5cbc7c5f0198c990d644d182104051776f54ee01b3ea833ec3c6ad440d8b777ead9acdd2ef3dda112a16b801e5964f3231c9')

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
