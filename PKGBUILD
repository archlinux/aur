# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-tenjin'
pkgver='1.000001'
pkgrel='1'
pkgdesc="Fast templating engine with support for embedded Perl."
arch=('any')
license=('MIT')
options=('!emptydirs')
depends=('perl-html-parser' 'perl-try-tiny')
makedepends=()
url='http://search.cpan.org/dist/Tenjin'
source=("http://search.cpan.org/CPAN/authors/id/I/ID/IDOPEREL/Tenjin-$pkgver.tar.gz")
sha256sums=('314a41ec9ca15fa6ea3ed36e3ed8264869f96d0d255dafbfdb224aea93f8a1e6')
_distdir="Tenjin-$pkgver"

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
