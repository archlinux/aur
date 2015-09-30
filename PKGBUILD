# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moosex-types-perl'
pkgver='0.101343'
pkgrel='1'
pkgdesc="Moose types that check against Perl syntax"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moosex-types' 'perl-params-util')
makedepends=()
url='https://metacpan.org/release/MooseX-Types-Perl'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/MooseX-Types-Perl-0.101343.tar.gz')
md5sums=('cbb223342a6048053bc4743c34fd5850')
sha512sums=('a3ad0f1b3dcde93f23254f084faadde7d3b03076f045802d7757c5580b2d0fb6cb748143a99fcd650492fc7da8938e28d8e0b7714070386638d972ab7d799e9a')
_distdir="MooseX-Types-Perl-0.101343"

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
