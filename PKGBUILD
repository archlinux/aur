# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-plack-middleware-fixmissingbodyinredirect'
pkgver='0.09'
pkgrel='1'
pkgdesc="Plack::Middleware which sets body for redirect response, if it's not already set"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-always>=0' 'perl-html-parser>=0' 'perl-http-message>=0' 'perl-plack>=0')
makedepends=()
url='http://search.cpan.org/dist/Plack-Middleware-FixMissingBodyInRedirect'
source=('http://search.cpan.org/CPAN/authors/id/S/SW/SWEETKID/Plack-Middleware-FixMissingBodyInRedirect-0.09.tar.gz')
md5sums=('7387d0186e814a8c3f5df9752558d733')
sha512sums=('a1d924feceaa84918740f93c3a3f98baccefac0ba5d599fd94ece797da8f3b2dd24d5717fd6fb39450d492b66b00c019f6d0f26ae2e60e34713ef2596bc4097a')
_distdir="Plack-Middleware-FixMissingBodyInRedirect-0.09"

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
