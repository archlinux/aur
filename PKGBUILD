# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-makemaker-cpanfile'
pkgver='0.09'
pkgrel='3'
pkgdesc="cpanfile support for EUMM"
arch=('any')
license=(' Artistic-1.0-Perl'
         ' GPL-1.0-only')
options=('!emptydirs')
depends=('perl-module-cpanfile>=0')
url='https://metacpan.org/release/ExtUtils-MakeMaker-CPANfile'
source=('http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/ExtUtils-MakeMaker-CPANfile-0.09.tar.gz')
sha512sums=('ff5b9d81ce5d8204fcd84ee88a2b5d8fe037cf5cae7a7291d7ccdc411301979093ae66d90203c6c16fddad5173a663f20fef0504ae684a8e522ef4b21c9edc13')
_distdir="ExtUtils-MakeMaker-CPANfile-0.09"

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
