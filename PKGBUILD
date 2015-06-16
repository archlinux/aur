# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-cache'
pkgver='0.12'
pkgrel='1'
pkgdesc="Flexible caching support for Catalyst."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-mro-compat' 'perl-task-weaken')
makedepends=('perl-test-deep' 'perl-test-exception')
url='http://search.cpan.org/dist/Catalyst-Plugin-Cache'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Plugin-Cache-0.12.tar.gz')
md5sums=('c97f0b2426cfa63d843695f328b790ab')
sha512sums=('02938e34758340d39b8c268e92d2e38763821e8c0aafad9fb9211911a5c6855ac992a86c29d9f43cf94d6f30e490c87750c8c9d1358a7d19714711c38547eb30')
_distdir="Catalyst-Plugin-Cache-0.12"

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
