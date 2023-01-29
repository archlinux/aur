# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-template-plugin-gettext'
pkgver='0.7'
pkgrel='1'
pkgdesc="Gettext Support For the Template Toolkit Version 2"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-locale-xgettext>=0' 'perl-module-build>=0.28' 'perl-template-toolkit>=0' 'perl-libintl-perl>=0')
makedepends=()
url='https://metacpan.org/release/Template-Plugin-Gettext'
source=('http://search.cpan.org/CPAN/authors/id/G/GU/GUIDO/Template-Plugin-Gettext-0.7.tar.gz')
md5sums=('9ba14744357bfe9b6976b10489cacffb')
sha512sums=('7e6ae0b92c3114fba2f6c6531975164ed126ae7b2ee02228f57f5f511781ddea4cbcc90494832e17448f4e7484f4f42185a9ee0a0573918fe5bca6645ed2afce')
_distdir="Template-Plugin-Gettext-0.7"

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
