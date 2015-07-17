# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-digest-perl-md5'
pkgver='1.9'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Digest-Perl-MD5'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DELTA/Digest-Perl-MD5-1.9.tar.gz')
md5sums=('41f1160e11ce0d99021fc8d6c725fa3d')
sha512sums=('015a1f046b85b5b89c1b44073d60116d483332cd667cb7230222df9651b7da837a532991e91848ff0b65f171b8870c2c4bda651da4ca54ea75d062ba6a55b525')
_distdir="Digest-Perl-MD5-1.9"

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
