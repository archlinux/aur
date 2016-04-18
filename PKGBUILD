# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-stripscripts-parser'
pkgver='1.03'
pkgrel='1'
pkgdesc="XSS filter using HTML::Parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser>=3.56' 'perl-html-stripscripts>=1.05')
makedepends=()
url='https://metacpan.org/release/HTML-StripScripts-Parser'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DRTECH/HTML-StripScripts-Parser-1.03.tar.gz')
md5sums=('b4c169034be56590a53f8835529627ba')
sha512sums=('3bc766ff738623191b23c5212751cad32b76160bf5e3dcdfad5e161288c906deb1357fc092a962da87525b7364ba924de9ef68b94966c003ee7cb23e8035dc15')
_distdir="HTML-StripScripts-Parser-1.03"

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
