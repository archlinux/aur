# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=debhelper-sphinx
pkgver=1.6.5
_debpkgrel=1
pkgrel=1
pkgdesc="debhelper scripts for sphinx docs: sphinxdoc.pm"
arch=("any")
url="https://packages.debian.org/sid/all/sphinx-common"
license=('BSD')
source=("http://ftp.de.debian.org/debian/pool/main/s/sphinx/sphinx-common_${pkgver}-${_debpkgrel}_all.deb")
sha512sums=('96b78e5ea8979afc3c14de1d4b739277019340b52d2f2f6e27b73df9bd5b0c2b3319887653e54c1a676a2235bee03cd60f46279b84b3775a865b570b98b6c7f2')

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
