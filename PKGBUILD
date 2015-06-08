# CPAN Name  : Reddit-Client
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-reddit-client'
pkgver='0.7'
pkgrel='1'
pkgdesc="A perl wrapper for Reddit"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message>=0' 'perl-io-capture>=0' 'perl-json>=0' 'perl-uri-encode>=0' 'perl-libwww>=0')
makedepends=()
checkdepends=('perl-test-mockmodule>=0')
url='http://search.cpan.org/dist/Reddit-Client'
source=('http://search.cpan.org/CPAN/authors/id/J/JE/JEFFOBER/Reddit-Client-0.7.tar.gz')
md5sums=('1c954a3f1feb8da90e1015d458c2a5c7')
sha512sums=('64a8f4a188ee932efe937d86cd309a76c6d5f647cc76695c0eb3088458f6de1d5a4c622aeb82d025162fb3a8b5056c9cc2aa2293da7114072d31b7823275d785')
_distdir="Reddit-Client-0.7"

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
