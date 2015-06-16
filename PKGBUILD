# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-actionrole-acl'
pkgver='0.07'
pkgrel='1'
pkgdesc="User role-based authorization action class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-controller-actionrole' 'perl-catalyst-runtime>=5.90013' 'perl-moose' 'perl-namespace-autoclean')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-ActionRole-ACL'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-ActionRole-ACL-0.07.tar.gz')
md5sums=('e4296bf6ce02dcf07190cc8355a7b57c')
sha512sums=('e3ad3404ba3285df909fd4111812b36af4630a9d893300d25a5ed21f582550fa765a403eb27df513c360b889d79e4960872335c4538418be7d3cdffe8fc9098c')
_distdir="Catalyst-ActionRole-ACL-0.07"

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
