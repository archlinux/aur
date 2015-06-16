# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-heap-simple'
pkgver='0.13'
pkgrel='1'
pkgdesc="Fast and easy to use classic heaps"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Heap-Simple'
source=('http://search.cpan.org/CPAN/authors/id/T/TH/THOSPEL/Heap-Simple-0.13.tar.gz')
md5sums=('7a70c8e7e52b35c33bbbb9ad8cdbdeb4')
sha512sums=('703e996ecc5cfac03eeb76cf1fa8c583536c391907d9639cc0eb64fc206a16e0c77f424b5ace0d812d1a2ff292ca06754a7e1bcfd14f4adfb2989050ebffe739')
_distdir="Heap-Simple-0.13"

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
