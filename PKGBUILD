# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-flow'
pkgver='0.86'
pkgrel='1'
pkgdesc="Store (restore) perl data structures in XML stream."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser' 'perl-xml-writer')
makedepends=()
url='http://search.cpan.org/dist/XML-Flow'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZA/ZAG/XML-Flow-0.86.tar.gz')
md5sums=('4c3c180d5e1d9724586b88dba22aaf41')
sha512sums=('522e08cb117ca529e4abc81a1eb56ac8a9fd92923f6f92783af9359cf42934c63ae8475f32164676f0b179656edef2c6d417c5edda700403344627c8abe0be5e')
_distdir="XML-Flow-0.86"

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
