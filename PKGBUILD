# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-csv-encoded'
pkgver='0.25'
pkgrel='1'
pkgdesc="Perl/CPAN Module Text::CSV::Encoded: Encoding aware Text::CSV."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-csv>=1.31' 'perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Text-CSV-Encoded'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZA/ZARQUON/Text-CSV-Encoded-0.25.tar.gz')
md5sums=('7625a81cabddd8f8d7e98dc4dc18861c')
sha512sums=('1f602e647803bf6af5bc7841c8b322998e98f2f5b3e61084b7273d60d28fd7171b69b629bece6def7c4e304cfcbe323658a594049606db220744cdc21ec688f3')
_distdir="Text-CSV-Encoded-0.25"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
