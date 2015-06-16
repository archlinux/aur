# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-template-plugin-stash'
pkgver='1.006'
pkgrel='1'
pkgdesc="expose the stash, ideal for Dumpering..."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-template-toolkit')
makedepends=()
url='http://search.cpan.org/dist/Template-Plugin-Stash'
source=('http://search.cpan.org/CPAN/authors/id/P/PO/PODMASTER/Template-Plugin-Stash-1.006.tar.gz')
md5sums=('8c640985f5b36a30a5af4cd5ab455b97')
sha512sums=('156e155ce7b571656f96099580c6cf876d6743c75621b71bf63a2855d448394d845b4fa69e20ed98192e914fd6093ced03c30253f1dc69b4c08288c6ccb87d56')
_distdir="Template-Plugin-Stash-1.006"

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
