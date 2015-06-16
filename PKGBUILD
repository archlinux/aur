# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-stem-fr'
pkgver='0.02'
pkgrel='1'
pkgdesc="Perl French Stemming"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Lingua-Stem-Fr'
source=('http://search.cpan.org/CPAN/authors/id/S/SD/SDP/Lingua-Stem-Fr-0.02.tar.gz')
md5sums=('b4ea5dd1d942b190160e9cbc73115b20')
sha512sums=('e0709c19f4a0f2ef79f459c05e2207e0b263859e913ab722701827b4ff391b50dd41e7e3a3e16600a61f8c7e1ed557111abc36965b58fbf28ed06f9bedc09cf4')
_distdir="Lingua-Stem-Fr-0.02"

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
