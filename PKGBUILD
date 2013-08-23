# CPAN Name  : IO::Handle::Util
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.13

pkgname=perl-io-handle-util
pkgver=0.01
pkgrel=1
pkgdesc="Perl module with functions for working with IO::Handle like objects"
arch=("any")
url="http://search.cpan.org/dist/IO-Handle-Util"
license=("PerlArtistic" "GPL")
depends=("perl" "perl-asa" "perl-io-string" "perl-sub-exporter")
checkdepends=("perl-test-use-ok")
source=(http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/IO-Handle-Util-0.01.tar.gz)
options=(!emptydirs)
md5sums=("ece953bc43c2e5914f92ec186cba0086")

build() {
  cd "$srcdir/IO-Handle-Util-0.01"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/IO-Handle-Util-0.01"
  make test
}

package() {
  cd "$srcdir/IO-Handle-Util-0.01"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
