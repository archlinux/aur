# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-getopt-long-descriptive'
pkgver='0.098'
pkgrel='1'
pkgdesc="Getopt::Long, but simpler and more powerful"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-params-validate>=0.97' 'perl-sub-exporter>=0.972')
makedepends=()
checkdepends=('perl-test-fatal' 'perl-test-warnings>=0.005')
url='http://search.mcpan.org/dist/Getopt-Long-Descriptive'
source=('http://search.mcpan.org/CPAN/authors/id/R/RJ/RJBS/Getopt-Long-Descriptive-0.098.tar.gz')
md5sums=('c6a8f5b8a3a1ddf80015aa6e302a50cc')
sha512sums=('c6db83140dd8030e4dd91810eb59722944dc675addbcb2eadf9781519842fd97ca76db1265f87a5a79197708e511ae31fc14c6b8c29ae50214e12e41f8822165')
_distdir="Getopt-Long-Descriptive-0.098"

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
