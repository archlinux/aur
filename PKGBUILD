# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-view-tenjin'
pkgver='0.050001'
pkgrel='1'
pkgdesc="Tenjin view class for Catalyst."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.80' 'perl-data-dump' 'perl-moose' 'perl-namespace-autoclean' 'perl-tenjin>=0.070001')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-View-Tenjin'
source=('http://search.cpan.org/CPAN/authors/id/I/ID/IDOPEREL/Catalyst-View-Tenjin-0.050001.tar.gz')
md5sums=('a4b0bdc90fd04683721adaec866f0fb1')
sha512sums=('6818d7cafb9f2f09cbd2ecc91eb27cb7fbde294de4f957ca2c61f95e7bca96e2f5cfa02933059f879868d38821575253ecab38ec9071196bf7f6249ea524fe94')
_distdir="Catalyst-View-Tenjin-0.050001"

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
