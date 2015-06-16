# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dbix-class-forceutf8'
pkgver='0.0.2'
pkgrel='1'
pkgdesc="Force UTF8 (Unicode) flag on columns"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbix-class')
makedepends=()
url='http://search.cpan.org/dist/DBIx-Class-ForceUTF8'
source=('http://search.cpan.org/CPAN/authors/id/T/TH/THORIKAWA/DBIx-Class-ForceUTF8-0.0.2.tar.gz')
md5sums=('ed58e3d97f5f440e243ae4ee2739ced3')
sha512sums=('966af61515d5958c9fb6802b40932b176676430936dd602558abac7fed21811abc2286a635d88b779e5992ec70a7bfe0ff6ecd21bc8df316cf3ef017219762c7')
_distdir="DBIx-Class-ForceUTF8-0.0.2"

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
