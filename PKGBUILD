# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-encoding'
pkgver='0.61'
pkgrel='1'
pkgdesc="Determine the encoding of HTML/XML/XHTML documents"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser' 'perl-http-message')
makedepends=()
url='http://search.cpan.org/dist/HTML-Encoding'
source=('http://search.cpan.org/CPAN/authors/id/B/BJ/BJOERN/HTML-Encoding-0.61.tar.gz')
md5sums=('bce9f00f04ad055feaa4d6511b30e421')
sha512sums=('eff1978f77e01efe37bcc2f04e48644f96072bb7649f04e35e1576a99fc45e794e0de07c49832b7fe4adaff91ab95e1b8a9adf2da4675a521fa3541f390242b6')
_distdir="HTML-Encoding-0.61"

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
