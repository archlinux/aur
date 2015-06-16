# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-object-tiny'
pkgver='1.08'
pkgrel='1'
pkgdesc="Class building as simple as it gets"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Object-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Object-Tiny-1.08.tar.gz')
md5sums=('01faa01e179ea95ec9e792dd0ead64f0')
sha512sums=('f74da73388ce9aa8a7e237afe4b38d529b145338f90efd85f20fd02161f953bf793f7bd65a3765237a6ef5c1fa2e77e236d631526d4a6c66075eafba73297b94')
_distdir="Object-Tiny-1.08"

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
