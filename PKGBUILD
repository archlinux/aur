# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-grove'
pkgver='0.46'
pkgrel='1'
pkgdesc="Perl-style XML objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser>=2.19')
makedepends=()
url='http://search.cpan.org/dist/XML-Grove'
source=('http://search.cpan.org/CPAN/authors/id/K/KM/KMACLEOD/XML-Grove-0.46alpha.tar.gz')
md5sums=('48bee70ae412bd6cf8ef302b6c68e24e')
sha512sums=('c49f9714721a2291d417849a2f9c6b994f856dc333393954b64f0bd0015c6a9bef8ebfa6bc360f001f496c57f60b793d286e42da3b50c494561d4d4066005d75')
_distdir="XML-Grove-0.46alpha"

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
