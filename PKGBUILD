# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-nicedump'
pkgver='1.0.1'
pkgrel='1'
pkgdesc="let's have a nice and human readable dump of our objects!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-safe-isa>=1.000010')
makedepends=()
url='https://metacpan.org/release/Test-NiceDump'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAKKAR/Test-NiceDump-1.0.1.tar.gz')
md5sums=('d08de03c540957f33e3590bbba548a4e')
sha512sums=('f439d3a4984b7e02794455a7b2e590da6dd97859c6da41045ed4b394fb66a996028eeba1214ec90aba3dc18174f0baa517d7b4ba2c724f7f592a79393fdcd5e4')
_distdir="Test-NiceDump-1.0.1"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
