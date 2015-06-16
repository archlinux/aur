# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-role-buildinstanceof'
pkgver='0.08'
pkgrel='1'
pkgdesc="Less Boilerplate when you need lots of Instances"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils' 'perl-moose' 'perl-moosex-iterator' 'perl-moosex-role-parameterized>=0.13' 'perl-moosex-types-path-class' 'perl-perl6-junction')
makedepends=()
url='http://search.cpan.org/dist/MooseX-Role-BuildInstanceOf'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/MooseX-Role-BuildInstanceOf-0.08.tar.gz')
md5sums=('c442cf9f9b1b51df171a7917eabc23f6')
sha512sums=('9a868fa3fd8a87631329703f5be20d7875dcc711c5f9fd6f6ea401923d53cb94797321413e6a1ddcd5995b05e84562ee1871efdb78fca2789c6ef88d8f0e6a6c')
_distdir="MooseX-Role-BuildInstanceOf-0.08"

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
