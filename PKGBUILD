# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cpanplus-dist-slackware'
pkgver='1.013'
pkgrel='1'
pkgdesc="Install Perl distributions on Slackware Linux"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/CPANPLUS-Dist-Slackware'
source=('http://search.cpan.org/CPAN/authors/id/V/VO/VOEGELAS/CPANPLUS-Dist-Slackware-1.013.tar.gz')
md5sums=('138f3a07c56e88347d49fe987fabb812')
sha512sums=('7b810ae5cf356c12707bfffd2f3eec90e324ca70c3c231fae9838e575d68c7e9e9b0ae73074f4c04a8f8266854ef05420eae3798498f7083321e414ba86a288f')
_distdir="CPANPLUS-Dist-Slackware-1.013"

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
