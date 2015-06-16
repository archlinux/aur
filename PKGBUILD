# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-tenjin'
pkgver='0.070001'
pkgrel='1'
pkgdesc="Fast templating engine with support for embedded Perl."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser' 'perl-try-tiny')
makedepends=()
url='http://search.cpan.org/dist/Tenjin'
source=('http://search.cpan.org/CPAN/authors/id/I/ID/IDOPEREL/Tenjin-0.070001.tar.gz')
md5sums=('ab3bfd6518483cd3ddad200e5453722e')
sha512sums=('879d21b7eeb6bed0f95cd7017e1da22d0d88b98833bf09b03a72a3d5c3b8a0fd703e15480e8b4f1e39090af91ebdb0657cfde4dfdfa68616e84ec3397cbf16b3')
_distdir="Tenjin-0.070001"

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
