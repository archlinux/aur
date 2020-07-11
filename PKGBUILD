# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=debhelper-sphinx
pkgver=3.1.2
_debpkgrel=1
pkgrel=1
pkgdesc="debhelper scripts for sphinx docs: sphinxdoc.pm"
arch=("any")
url="https://packages.debian.org/sid/all/sphinx-common"
license=('BSD')
source=("https://deb.debian.org/debian/pool/main/s/sphinx/sphinx-common_${pkgver}-${_debpkgrel}_all.deb")
sha512sums=('de4f55079aa6dd8d06ed2aee844905f98e749e8755cc09cc1a66d5fff3f5db159615865d612e2df288396c5a8db42b4167ae65e8fd1f147dc86d0c7c3fb12efe')

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
