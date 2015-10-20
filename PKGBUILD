# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl6-export-attrs'
pkgver='0.000004'
pkgrel='1'
pkgdesc="The Perl 6 'is export(...)' trait as a Perl 5 attribute"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Perl6-Export-Attrs'
source=('http://search.cpan.org/CPAN/authors/id/D/DC/DCONWAY/Perl6-Export-Attrs-0.000004.tar.gz')
md5sums=('e65c7eece62f9892a79ad6ce00aa95bd')
sha512sums=('c9408417d5c4e338448473c19328bfe70a5be058e339f57df5242ea1106ef1088eff0c01719c31fdea890fc03feb56f4d2b21bab143ed6924e782053f5606fe0')
_distdir="Perl6-Export-Attrs-0.000004"

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
