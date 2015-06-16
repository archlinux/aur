# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-formvalidator'
pkgver='0.094'
pkgrel='1'
pkgdesc="Data::FormValidator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-data-formvalidator' 'perl-moose>=0.93' 'perl-mro-compat')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Plugin-FormValidator'
source=('http://search.cpan.org/CPAN/authors/id/D/DH/DHOSS/Catalyst-Plugin-FormValidator-0.094.tar.gz')
md5sums=('7b0caa2d001fd63167b6645ca2df11d2')
sha512sums=('02bb20684db64c9c7510cfdeae54fb2f95ee67a7c1dde12bbba556fd10d8a882c70d8f400689cde65b340b26247cbc443fb09a8586c792b2e1b1e82cbed05caa')
_distdir="Catalyst-Plugin-FormValidator-0.094"

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
