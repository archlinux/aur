# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-sys-sigaction'
pkgver='0.20'
pkgrel='1'
pkgdesc="Perl extension for Consistent Signal Handling"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Sys-SigAction'
source=('http://search.cpan.org/CPAN/authors/id/L/LB/LBAXTER/Sys-SigAction-0.20.tar.gz')
md5sums=('7ca212559c2c514277c4f81039456226')
sha512sums=('e9a601e59dce17b58f525a6323fe87cca968db1142905eb69167d849039014521115d87ffc594fd67df2ec3072e8fc82aaefbf8671f8c9598c1792f6850c4370')
_distdir="Sys-SigAction-0.20"

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
