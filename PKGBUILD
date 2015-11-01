# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-exception-warning'
pkgver='0.0401'
pkgrel='1'
pkgdesc="Convert simple warn into real exception object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exception-base>=0.21' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-assert>=0.05' 'perl-test-unit-lite>=0.12')
url='https://metacpan.org/release/Exception-Warning'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DEXTER/Exception-Warning-0.0401.tar.gz')
md5sums=('4c2e830df81ba513413e989d7f399afc')
sha512sums=('063250f7c821b04cf18b31ac4a7a688e4838573c41662325baa400afa26e97eeae640cf77a2ba45232e20cda54a7ca02772091fd37816afb5fffef8a7c56380d')
_distdir="Exception-Warning-0.0401"

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
