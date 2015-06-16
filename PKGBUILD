# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-data-printer'
pkgver='0.35'
pkgrel='2'
pkgdesc="colored pretty-print of Perl data structures and objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone-pp' 'perl-file-homedir' 'perl-package-stash' 'perl-sort-naturally' 'perl-module-implementation')
makedepends=()
url='http://search.cpan.org/dist/Data-Printer'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GARU/Data-Printer-0.35.tar.gz')
md5sums=('621fde4207475fce3089a58d14c8e5c3')
sha512sums=('ce1149c26cbc6e44d31be688003c13d11ea014c53c14b5aea0c050e133f65a355ce571f3c7a9cf32b955f348212ca61aab7e08cd06c6d62618f437cb8b238172')
_distdir="Data-Printer-0.35"

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
