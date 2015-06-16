# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-audio-musepack'
pkgver='1.0.1'
pkgrel='1'
pkgdesc="An object-oriented interface to Musepack file information and APE tag fields."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.005' 'perl-audio-scan>=0.85')
makedepends=()
url='http://search.cpan.org/dist/Audio-Musepack'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DANIEL/Audio-Musepack-1.0.1.tar.gz')
md5sums=('0a3adba7352af764f9fdfc3e8382aca8')
sha512sums=('704b8d7948675fc8c5c691dd1ca10b375b6089b5bd538ccfeefbeed327bb95661e45562dccf39aa95852810e3e2dd75e6a576781fc781b8bf1b5c33569db1f50')
_distdir="Audio-Musepack-1.0.1"

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
