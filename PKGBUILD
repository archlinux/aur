# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-en-titlecase-simple'
pkgver='1.004'
pkgrel='1'
pkgdesc="Automatically title-case headlines and title-texts."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Lingua-EN-Titlecase-Simple'
source=("https://cpan.metacpan.org/authors/id/A/AR/ARISTOTLE/Lingua-EN-Titlecase-Simple-${pkgver}.tar.gz")
sha512sums=('eec2bec0f27631b403441e39dea2d5d2c7fd521ca6b3e81c0f27567379af90f094832687be930d860ff8abd84097ebbff129eb8a13ca1e9c2049290919bea2fe')
_distdir="Lingua-EN-Titlecase-Simple-${pkgver}"

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
