# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-padre-plugin-mojolicious'
pkgver='0.06'
pkgrel='1'
pkgdesc="Mojolicious support for Padre"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-mojolicious>=2.34' 'perl-padre>=0.92')
makedepends=()
url='http://search.cpan.org/dist/Padre-Plugin-Mojolicious'
source=('http://search.cpan.org/CPAN/authors/id/A/AZ/AZAWAWI/Padre-Plugin-Mojolicious-0.06.tar.gz')
md5sums=('e8edfc596ba6ea75f9cb105578eb52e2')
sha512sums=('3ffde6428a6889a2892bef8cb02aded22394fb8696c74db1edfd183e8cc9d9c49240f650656d2a22e8efcd1e5b488cb1552fae5af2869ec4b71e551a34746ea3')
_distdir="Padre-Plugin-Mojolicious-0.06"

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
