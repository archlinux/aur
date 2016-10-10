# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-ref-util'
pkgver='0.101'
pkgrel='1'
pkgdesc="Utility functions for checking references"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.2')
makedepends=()
url='https://metacpan.org/release/Ref-Util'
source=('http://search.cpan.org/CPAN/authors/id/X/XS/XSAWYERX/Ref-Util-0.101.tar.gz')
md5sums=('d836d1e2e9a730111b9dbccbc4e6faa8')
sha512sums=('3b5ec65a6d3098615ada29be8f2a61800c351549dc33b6133522dba528108b2199e73a941212bba381de91508b7e7a01189b4c0728a669ed78c25f06641c10fb')
_distdir="Ref-Util-0.101"

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
