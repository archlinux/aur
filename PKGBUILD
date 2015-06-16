# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-authorization-roles'
pkgver='0.09'
pkgrel='1'
pkgdesc="Role based authorization for Catalyst based on Catalyst::Plugin::Authentication"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-catalyst-plugin-authentication>=0.10003' 'perl-catalyst-runtime>=5.7' 'perl-set-object>=1.14' 'perl-universal-isa>=0.05')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/Catalyst-Plugin-Authorization-Roles'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Plugin-Authorization-Roles-0.09.tar.gz')
md5sums=('d2797b0e1fc8e960cf92d9b725e33630')
sha512sums=('fb3ac02991a1f55cc90750a914c956042a06c77012d1a060ff5f67717130d23aafab47e62d6aae0787f33cb7064d05e5f3e758ff8680558c9e537a4123d38482')
_distdir="Catalyst-Plugin-Authorization-Roles-0.09"

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
