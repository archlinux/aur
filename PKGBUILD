# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-ima-dbi'
pkgver='0.35'
pkgrel='1'
pkgdesc="Database connection caching and organization"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-data-inheritable>=0.02' 'perl-dbi>=1.2' 'perl-dbix-contextualfetch>=1')
makedepends=()
url='http://search.cpan.org/dist/Ima-DBI'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PERRIN/Ima-DBI-0.35.tar.gz')
md5sums=('f3c5c0b1fe509556ca35f08aae91b3f5')
sha512sums=('9ccf86b440d0969fc6ebbc5d66db0edbff680eaac33d64d75954b5c6a669219ba8a37cb4914aa8f495e96e990c337f550a439e111ec2278fa133956773b55678')
_distdir="Ima-DBI-0.35"

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
