# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-io-all-lwp'
pkgver='0.14'
pkgrel='1'
pkgdesc="Use HTTP and FTP URLs with IO::All"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-all>=0.30' 'perl-libwww')
makedepends=()
url='http://search.cpan.org/dist/IO-All-LWP'
source=('http://search.cpan.org/CPAN/authors/id/I/IT/ITUB/IO-All-LWP-0.14.tar.gz')
md5sums=('2971dc7889c0c523237b1fd4488c6cdb')
sha512sums=('5636d6d01ddb8a9a216a28a23223599caf91e8fcfd9e2fd2e6891abee7f574e51a233bfcd8f0529c9c9ce43cc58c586a2bf8986e09fe1de9091b6e73b24a186a')
_distdir="IO-All-LWP-0.14"

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
