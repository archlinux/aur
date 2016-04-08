# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-flow'
pkgver='1.01'
pkgrel='1'
pkgdesc="Make data flow processing easy"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2.21' 'perl-xml-flow>=0.85')
makedepends=()
url='https://metacpan.org/release/Flow'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZA/ZAG/Flow-1.01.tar.gz')
md5sums=('b55494e4b15cc1fe267b5fa55daf608b')
sha512sums=('d6407cd788f8268b27f7be53617943d0a03e3a1d73445ac2864dfe88e6a07d1fdc7a73da58462aa374c577d83b4348812984b93b401ec75f02c1df9ca1d2bd3f')
_distdir="Flow-1.01"

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
