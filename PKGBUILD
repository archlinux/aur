# CPAN Name  : Net-IRC
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-irc'
pkgver='0.79'
pkgrel='2'
pkgdesc="DEAD SINCE 2004 Perl interface to the Internet Relay Chat protocol"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Net-IRC'
source=('http://search.cpan.org/CPAN/authors/id/A/AP/APEIRON/Net-IRC-0.79.tar.gz')
md5sums=('5849c6e482ade4367d783e04a4530ee6')
sha512sums=('daf51ec64aa4e630a4e3d6da48a24cc01737fe702269633d4b392662aacd45d3ed00adfe1fbd32905575f9905dee362d68ff030c7918fa17acb9a508474177f5')
_distdir="Net-IRC-0.79"

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
