# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-pod-spell'
pkgver='1.17'
pkgrel='1'
pkgdesc="a formatter for spellchecking Pod"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny' 'perl-file-sharedir-projectdistdir>=1.000' 'perl-lingua-en-inflect' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-deep')
url='https://metacpan.org/release/Pod-Spell'
source=('http://search.cpan.org/CPAN/authors/id/X/XE/XENO/Pod-Spell-1.17.tar.gz')
md5sums=('b0895135155569ad4f8903ab11cbeb0b')
sha512sums=('45538a9d310d7a9b61607919e71421e1dab604d7acac591248d54cc98747cc49adea72d1d53be8dce6b969cb31cf7948348364da2e6d3b0421421380e121753b')
_distdir="Pod-Spell-1.17"

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
