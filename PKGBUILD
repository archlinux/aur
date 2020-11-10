# Maintainer : Dylan Delgado <dylan1496 at live dot com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-math-int64'
pkgver='0.54'
pkgrel='1'
pkgdesc="Manipulate 64 bits integers in Perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Math-Int64'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SALVA/Math-Int64-0.54.tar.gz')
md5sums=('1ad0ce8b5e903dfe9f7ffbabd8a43014')
sha512sums=('03677df499ebc3924fabefbc6fb863adc2f765341a9697305b03bb24477b391029e65cc492c831a24e282e26e850082abbd0e52dda198aa041f3f4f41cc4f995')
_distdir="Math-Int64-0.54"

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
