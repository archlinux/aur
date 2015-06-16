# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-view-json'
pkgver='0.33'
pkgrel='1'
pkgdesc="JSON view for your data"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-catalyst-runtime' 'perl-json-any>=1.15' 'perl-mro-compat')
makedepends=('perl-yaml')
url='http://search.cpan.org/dist/Catalyst-View-JSON'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Catalyst-View-JSON-0.33.tar.gz')
md5sums=('30f15ca2a509f522589c1756095dff3c')
sha512sums=('100474b849016b499c670110b27eca3a138217bfb66bbec198572b8008d93be31887870642a6ba2b20f65d16b83383c88893b91a6424d6d2d0a6c0107d6b9c1d')
_distdir="Catalyst-View-JSON-0.33"

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
