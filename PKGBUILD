# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-digest-shavite3'
pkgver='0.02'
pkgrel='1'
pkgdesc="Perl interface to the SHAvite-3 digest algorithm"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Digest-SHAvite3'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRAY/Digest-SHAvite3-0.02.tar.gz')
md5sums=('976b12920c67e8951f62f0b77da8ec6e')
sha512sums=('de406fc1cc76956215b7d87f203fb7bf27864ea1814bc01269cdbca6e1b497b11ed9e36de514bd225b5a930b2945e028a79600fa49dbcca5d7462a3cdc6a845b')
_distdir="Digest-SHAvite3-0.02"

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
