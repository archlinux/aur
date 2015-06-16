# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dancer-template-caml'
pkgver='0.10'
pkgrel='1'
pkgdesc="Text::Caml for Dancer"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.7' 'perl-dancer>=1.3072' 'perl-text-caml>=0.009005')
makedepends=()
url='http://search.cpan.org/dist/Dancer-Template-Caml'
source=('http://search.cpan.org/CPAN/authors/id/V/VT/VTI/Dancer-Template-Caml-0.10.tar.gz')
md5sums=('c160749c64a7cf38f099cc05f058b785')
sha512sums=('6adeafad5f7bdfe4dd92031f6bfc4b46a9f1d081d27b22d36ef1a2b222471a9fc8dd053d9bf14648a20c822c70441f799692d29d8510813aa5ee61ed5895e4fa')
_distdir="Dancer-Template-Caml-0.10"

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
