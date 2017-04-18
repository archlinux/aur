# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-datetime-format-natural'
pkgver='1.04'
pkgrel='1'
pkgdesc="Parse informal natural language date/time strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone' 'perl-datetime' 'perl-datetime-timezone' 'perl-list-moreutils' 'perl-module-util' 'perl-params-validate' 'perl-boolean')
makedepends=()
checkdepends=('perl-test-mocktime')
url='https://metacpan.org/release/DateTime-Format-Natural'
source=('http://search.cpan.org/CPAN/authors/id/S/SC/SCHUBIGER/DateTime-Format-Natural-1.04.tar.gz')
md5sums=('62e7a7ff35cf5f9bcfd993d1aa6984fe')
sha512sums=('4d48ec2180f56333bc50dfe75609e09574bec502bae38a858c82467b6030dcedaec14f94fc6da182d159c1070ebe734f5e3de9d7ad0f82fe99fce885744ea213')
_distdir="DateTime-Format-Natural-1.04"

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
