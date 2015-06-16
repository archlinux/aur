# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetime-event-holiday-us'
pkgver='0.02'
pkgrel='1'
pkgdesc="US Holiday's as DateTime::Set objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.004' 'perl-datetime-format-ical' 'perl-datetime-set' 'perl-path-class' 'perl-try-tiny')
makedepends=('perl-test-perl-critic-progressive')
url='http://search.cpan.org/dist/DateTime-Event-Holiday-US'
source=('http://search.cpan.org/CPAN/authors/id/A/AY/AYOUNG/DateTime-Event-Holiday-US-0.02.tar.gz')
md5sums=('775da534b5fba049b209b2e44a29235f')
sha512sums=('8f0a6af3dc58afd2215d17dfa814614369c9f1acef1432c4b2ea6e1250c13c961948722bdaeb59b35508b7d2c926d358199b2907c60aa00926c3d7f9cee97ec1')
_distdir="DateTime-Event-Holiday-US-0.02"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
