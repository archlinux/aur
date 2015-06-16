# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-authorization-acl'
pkgver='0.15'
pkgrel='1'
pkgdesc="ACL support for Catalyst applications."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-plugin-authentication' 'perl-catalyst-plugin-authorization-roles' 'perl-catalyst-runtime>=5.80013' 'perl-class-data-inheritable' 'perl-class-throwable' 'perl-moose' 'perl-mro-compat' 'perl-namespace-autoclean' 'perl-tree-simple' 'perl-tree-simple-visitorfactory')
makedepends=('perl-catalyst-plugin-session' 'perl-catalyst-plugin-session-state-cookie' 'perl-test-www-mechanize-catalyst')
url='http://search.cpan.org/dist/Catalyst-Plugin-Authorization-ACL'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/Catalyst-Plugin-Authorization-ACL-0.15.tar.gz')
md5sums=('653a88331431ad2644999d8995f18fbf')
sha512sums=('770010f36cbd362977db4af602b96af9b34a0eec11f5a958a74a134a6e58d4187d2391f85149c6d6e0bd8cc2b557cf69e0f4c7f712ffbb63f7d858bf93aa0b51')
_distdir="Catalyst-Plugin-Authorization-ACL-0.15"

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
