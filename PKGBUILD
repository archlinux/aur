# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-locale-msgfmt'
pkgver='0.15'
pkgrel='1'
pkgdesc="Compile .po files to .mo files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.5')
makedepends=()
url='http://search.cpan.org/dist/Locale-Msgfmt'
source=('http://search.cpan.org/CPAN/authors/id/A/AZ/AZAWAWI/Locale-Msgfmt-0.15.tar.gz')
md5sums=('7e6fde43db034f765f3a425dfa1dd4d8')
sha512sums=('4de0462c6c420f4d4026acd78838db72e997119688f758183cd182bf3595f4f732152193df995bb546e1dc8ddd5f7f509702c40fcab9d562ffe7876a571539c4')
_distdir="Locale-Msgfmt-0.15"

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
