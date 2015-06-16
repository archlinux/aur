# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-flv-info'
pkgver='0.24'
pkgrel='1'
pkgdesc="Extract metadata from Adobe Flash Video files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-amf-perl>=0.15' 'perl-list-moreutils' 'perl-readonly' 'perl-swf-file>=0.033' 'perl>=5.008')
makedepends=()
url='https://metacpan.org/release/FLV-Info'
source=('http://search.cpan.org/CPAN/authors/id/C/CD/CDOLAN/FLV-Info-0.24.tar.gz')
md5sums=('7f8f11619c58f08154c0a18c76df9299')
sha512sums=('d5b149fbfea816037e620492bfd9529697bd10afc6d58ef323db9b20000e53d893e9df0df7e0c28ea30d5ba06eb9427763d48fed69c1eacba7e76a56a256182c')
_distdir="FLV-Info-0.24"

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
