# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-cpan-changes-reallystrict'
pkgver='1.000004'
pkgrel='2'
pkgdesc="Ensure a Changes file looks exactly like it would if it was machine generated."
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-cpan-changes>=0.27' 'perl-class-tiny>=0' 'perl-try-tiny>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-CPAN-Changes-ReallyStrict'
source=("http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/Test-CPAN-Changes-ReallyStrict-$pkgver.tar.gz")
md5sums=('1fcbd5e1baedabaf2ae85befac71abb7')
sha512sums=('b6b7c2a90f5f64ff2a2d963563c804434eef0ce192655d272696cfc1e9c1054b691199ad2b7d649aaf4c11626fc3df40c013c1b13f88bc20c196511a066e17c9')
_distdir="Test-CPAN-Changes-ReallyStrict-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
