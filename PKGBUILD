# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-psh'
pkgver='1.8.1'
pkgrel='1'
pkgdesc="Perl Shell"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-term-readline-gnu' 'perl-term-readline-perl' 'perl-bsd-resource')
makedepends=()
url='http://search.mcpan.org/dist/psh'
source=('http://search.mcpan.org/CPAN/authors/id/G/GR/GREGOR/psh-1.8.1.tar.gz')
md5sums=('0b992dbfb907b571249923b51b213133')
sha512sums=('20ac6d6d39ff0820eee6314e73c02f18b9362ef3dde6e2c6cd68094d1ebc435d26bf3528e858042b95372916821077e5a4e5d4b376aac68caf6d8fc629a61c07')
_distdir="psh-1.8.1"

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
