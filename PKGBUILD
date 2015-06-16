# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-fillinform-forceutf8'
pkgver='0.02'
pkgrel='1'
pkgdesc="FillInForm with utf8 encoding"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-fillinform')
makedepends=()
url='http://search.cpan.org/dist/HTML-FillInForm-ForceUTF8'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/HTML-FillInForm-ForceUTF8-0.02.tar.gz')
md5sums=('10b5a3fd3da9af7ebbbb792a49b90832')
sha512sums=('bafe978979e3a3deb0cc56c0cd0bb1fc3ee398317c29ba1c99b2e69442fe4f155a2a3f06cad087c4fcc845eeb74438fb15603415e830b3e339bffca3bb48f125')
_distdir="HTML-FillInForm-ForceUTF8-0.02"

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
