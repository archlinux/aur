# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-debug-showstuff'
pkgver='1.16'
pkgrel='1'
pkgdesc="Debug::ShowStuff - A collection of handy debugging routines for displaying the values of variables with a minimum of coding."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-isa' 'perl-devel-stacktrace' 'perl-string-util' 'perl-term-readkey' 'perl-text-tabulardisplay' 'perl-tie-ixhash')
makedepends=()
url='http://search.cpan.org/dist/Debug-ShowStuff'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIKO/Debug-ShowStuff-1.16.tar.gz')
md5sums=('435937b830976b4ff486e200ca176b2e')
sha512sums=('7d42e664812d03b4bbbebb307ae4a8f1ab6ff1dfcd1e1f6a9d9b80fdbd227e37732a2309a14174307690f4fca3db62376cf116585cfad10814f0143111af5de9')
_distdir="Debug-ShowStuff-1.16"

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
