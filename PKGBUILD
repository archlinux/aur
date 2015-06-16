# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-types-datetime-morecoercions'
pkgver='0.11'
pkgrel='1'
pkgdesc="Extensions to L<MooseX::Types::DateTime>"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.3' 'perl-datetime>=0.4302' 'perl-datetimex-easy>=0.085' 'perl-moose>=0.41' 'perl-moosex-types>=0.04' 'perl-moosex-types-datetime>=0.07' 'perl-namespace-clean>=0.08' 'perl-time-duration-parse>=0.06')
makedepends=('perl-test-exception>=0.27' 'perl-test-use-ok>=0.02')
url='http://search.cpan.org/dist/MooseX-Types-DateTime-MoreCoercions'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/MooseX-Types-DateTime-MoreCoercions-0.11.tar.gz')
md5sums=('3e44c704976382c74d1f7bd6a7673c25')
sha512sums=('4a3220e62b92affa0f3eb5121ca53613aefe28b2d4e5a5ef8be7ca24e5be583a4e6ffc69ca751fc7474bc4f51fc7c3479e9fcda4c5e3888dbaacc31de67815c9')
_distdir="MooseX-Types-DateTime-MoreCoercions-0.11"

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
