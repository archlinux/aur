# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-marc-record'
pkgver='2.0.7'
pkgrel='1'
pkgdesc="Perl/CPAN Module MARC::Record: Perl extension for handling MARC records"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/MARC-Record'
source=("http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-Record-$pkgver.tar.gz")
md5sums=('08eb3de46eb3808a31910bbb489f3b9e')
sha512sums=('81e29de564ced204b45a18765f1d51664f8d8d9584c7000b92902ddf8adfa9c17837f4f7de1a6b64e59f08257f89295e8d6ff9edf4b78a90556ce1e65cf97601')
_distdir="MARC-Record-$pkgver"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod -o -name Tutorial.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
