# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-view-tt'
pkgver='0.45'
pkgrel='1'
pkgdesc="Template View Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=0' 'perl-class-accessor>=0' 'perl-data-dump>=0' 'perl-mro-compat>=0' 'perl-path-class>=0' 'perl-template-timer>=0' 'perl-template-toolkit>=0' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Catalyst-View-TT'
source=('https://cpan.metacpan.org/authors/id/H/HA/HAARG/Catalyst-View-TT-0.45.tar.gz')
md5sums=('f21269e823fb7a5795a39a261305869e')
sha512sums=('3c9814c584852c227eaca09d862b9e5519e24c43831d951a4cd7a941adec43a794b39e8ec596f208d56dd7dd42e5fe1a8a3fb40fdd572cff3bebc95bce0cb7ad')
_distdir="Catalyst-View-TT-0.45"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
