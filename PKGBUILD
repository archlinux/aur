# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-install-readmefrompod'
pkgver='0.20'
pkgrel='1'
pkgdesc="A Module::Install extension to automatically convert POD to a README"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-module-install>=1')
makedepends=('perl-capture-tiny>=0.05')
url='http://search.cpan.org/dist/Module-Install-ReadmeFromPod'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Module-Install-ReadmeFromPod-0.20.tar.gz')
md5sums=('2d5fce46b8952ceb1cd63c1310735ca0')
sha512sums=('18fb2f3e72ad7730f20e2d16ca17811d285703012557a8bd39e8f4b17424dc2477f6bbf41ad42cfb4d15bf7e8baa39682c79b4048eeff048baa9cfc9c6937cfe')
_distdir="Module-Install-ReadmeFromPod-0.20"

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
