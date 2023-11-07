# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-template-plugin-gettext'
pkgver='1.0'
pkgrel='1'
pkgdesc="Gettext Support For the Template Toolkit Version 2"
arch=('any')
license=('LGPL3')
options=('!emptydirs')
depends=('perl-locale-xgettext>=0.7' 'perl-module-build>=0.28' 'perl-template-toolkit>=0' 'perl-libintl-perl>=0')
makedepends=()
url='https://metacpan.org/release/Template-Plugin-Gettext'
source=('http://search.cpan.org/CPAN/authors/id/G/GU/GUIDO/Template-Plugin-Gettext-1.0.tar.gz')
md5sums=('cfabfb39186b0529a0472872272fda0a')
sha512sums=('21a591f966ff8b410c09bedd06a40315f4f2ea50c9bcd4c51bcc1960bd28e2d9a5b1d208607795bf6670bc2277f243bf9ffa450a9deb3cc6a8f813150cfba10a')
_distdir="Template-Plugin-Gettext-1.0"

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
