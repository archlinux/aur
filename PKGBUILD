# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-signature'
pkgver='0.73'
pkgrel='1'
pkgdesc="Module signature file manipulation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.005')
makedepends=('perl-ipc-run')
url='http://search.cpan.org/dist/Module-Signature'
source=('http://search.cpan.org/CPAN/authors/id/A/AU/AUDREYT/Module-Signature-0.73.tar.gz')
md5sums=('de27bbca948ba8a13a7f614414cb623d')
sha512sums=('dd43923aa2bd21ec4025360d8ba27936d1e8d9906799b91d0386887c14326fd40e3e684afdffa37d36665a7c64bc4e582a83b3bb3b366bb49f76d2b28cb5eb41')
_distdir="Module-Signature-0.73"

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
