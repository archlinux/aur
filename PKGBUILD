# Contributor: gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-term-size-any'
pkgver='0.002'
pkgrel='1'
pkgdesc="Retrieve terminal size"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-hide>=0' 'perl-term-size-perl>=0')
makedepends=()
url='https://metacpan.org/release/Term-Size-Any'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/Term-Size-Any-0.002.tar.gz')
md5sums=('f9e3fde1e494c908369dc3ce7e9b19a1')
sha512sums=('e34d7e8d03e71e9f1758551e702711550804560a3165e0e9cea6756a7d87043e0408123b8c7997c79d6d77e7d48f167ed5aa12e4d572b1d787ef638ff71a3a1d')
_distdir="Term-Size-Any-0.002"

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
