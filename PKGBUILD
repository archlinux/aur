# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-devel-beginlift'
pkgver='0.001003'
pkgrel='1'
pkgdesc="make selected sub calls evaluate at compile time"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-b-hooks-op-check-entersubforcv>=0.03')
makedepends=('perl-b-hooks-op-check-entersubforcv' 'perl-extutils-depends')
url='http://search.cpan.org/dist/Devel-BeginLift'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Devel-BeginLift-0.001003.tar.gz')
md5sums=('73aee2339c9fbe090ba47736a4e0f808')
sha512sums=('ffe1e14bd5905ebf4226da118329e2f63d5a237f81b92367a473861ce2bbf3bb418bd0674ef82bbead024d5c42e0ccec705065cdeeaa473b07cf7b7c0de9dafa')
_distdir="Devel-BeginLift-0.001003"

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
