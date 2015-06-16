# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-file-userconfig'
pkgver='0.06'
pkgrel='1'
pkgdesc="Get a user's existing config directory, or copy in defaults"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-extutils-makemaker' 'perl-file-homedir>=0.51' 'perl-file-sharedir>=1.00' 'perl')
makedepends=('perl-file-remove>=1.42')
url='http://search.cpan.org/dist/File-UserConfig'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/File-UserConfig-0.06.tar.gz')
md5sums=('3f65da7bfc7949a4d0c088eeec2a4979')
sha512sums=('becf9b8a89a626c8959844f56df4d5757a2343b252aa9a7bfc9d300e629a69c54be441e24e53c30cabe946535a3224247843cd08ded3c548824e53579a3c21fd')
_distdir="File-UserConfig-0.06"

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
