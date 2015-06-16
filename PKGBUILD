# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-www-checksite'
pkgver='0.020'
pkgrel='1'
pkgdesc="OO interface to an iterator that checks a website"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-template-toolkit' 'perl-www-mechanize>=1.2' 'perl-www-robotrules')
makedepends=()
url='http://search.cpan.org/dist/WWW-CheckSite'
source=('http://search.cpan.org/CPAN/authors/id/A/AB/ABELTJE/WWW-CheckSite-0.020.tar.gz')
md5sums=('eb0ae4a4267119c401c2d315f159216d')
sha512sums=('8c0d8dadc6f885c5c4b3204168394f43680329016600676aa6c17ed4186b9f922c3f049427bb9bbcde7c5fd766360aea2d768c40b2e1d11ea8ae2776f807fa30')
_distdir="WWW-CheckSite-0.020"

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
