# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-filesys-notify-simple'
pkgver='0.12'
pkgrel='1'
pkgdesc="Simple and dumb file system watcher"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-sharedfork>=0')
url='http://search.cpan.org/dist/Filesys-Notify-Simple'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Filesys-Notify-Simple-0.12.tar.gz')
md5sums=('d1886453241db0a034e5aacd02ee1f72')
sha512sums=('3edb9a5087b82c87bea1b4092a3c7c264ec6f8da391052593e504b16392ea1a84771bbcbad21d623f727682cc6ab4474fe6a7e346c8bebe13f60d39e83594e2b')
_distdir="Filesys-Notify-Simple-0.12"

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
