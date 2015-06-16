# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-task-catalyst'
pkgver='4.02'
pkgrel='1'
pkgdesc="All you need to start with Catalyst"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-action-rest' 'perl-catalyst-actionrole-acl' 'perl-catalyst-authentication-credential-http' 'perl-catalyst-authentication-store-dbix-class' 'perl-catalyst-component-instancepercontext' 'perl-catalyst-controller-actionrole' 'perl-catalyst-devel>=1.26' 'perl-catalyst-manual>=5.80' 'perl-catalyst-model-adaptor' 'perl-catalyst-model-dbic-schema' 'perl-catalyst-plugin-authentication' 'perl-catalyst-plugin-configloader' 'perl-catalyst-plugin-i18n' 'perl-catalyst-plugin-session' 'perl-catalyst-plugin-session-state-cookie' 'perl-catalyst-plugin-session-store-dbic' 'perl-catalyst-plugin-session-store-file' 'perl-catalyst-plugin-stacktrace' 'perl-catalyst-plugin-static-simple' 'perl-catalyst-runtime' 'perl-catalyst-view-email' 'perl-catalyst-view-tt' 'perl-catalystx-component-traits' 'perl-catalystx-leakchecker' 'perl-catalystx-profile' 'perl-catalystx-repl' 'perl-catalystx-simplelogin' 'perl-fcgi' 'perl-fcgi-procmanager' 'perl-local-lib' 'perl-starman')
makedepends=('perl-test-www-mechanize-catalyst')
url='http://search.cpan.org/dist/Task-Catalyst'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Task-Catalyst-4.02.tar.gz')
md5sums=('34719bd8b82392e01bd06388241cd72f')
sha512sums=('5874d2dffdec143482549196f0bae20d3cc2bd2344ff69ee9f1daf5cd9145addf94dcbaad3ca353d7025cbdff2b59bc1c8095a3c74e98a030f6a1c8ea4f40f13')
_distdir="Task-Catalyst-4.02"

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
