# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-syntax-keyword-junction'
pkgver='0.003007'
pkgrel='1'
pkgdesc="Perl6 style Junction operators in Perl5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter-progressive>=0.001006' 'perl-syntax>=0')
makedepends=()
checkdepends=('perl-test-requires>=0.07')
url='http://search.cpan.org/dist/Syntax-Keyword-Junction'
source=('http://search.cpan.org/CPAN/authors/id/F/FR/FREW/Syntax-Keyword-Junction-0.003007.tar.gz')
md5sums=('a47d97ae6f129f654690ab82c8c717d1')
sha512sums=('512c6f931269fd30409cbbe2e90794eb0b47713ec7c5dde86c89678b785311a4adb64976a7336a29823e36f8afa412bf0d316bcb0949df894fd1a52b09a4ae39')
_distdir="Syntax-Keyword-Junction-0.003007"

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
