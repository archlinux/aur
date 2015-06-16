# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-css-minifier-xs'
pkgver='0.08'
pkgrel='1'
pkgdesc="XS based CSS minifier"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/CSS-Minifier-XS'
source=('http://search.cpan.org/CPAN/authors/id/G/GT/GTERMARS/CSS-Minifier-XS-0.08.tar.gz')
md5sums=('10a71fd208a20f69c13526a3f592d934')
sha512sums=('f9aaf1f035d23dfa42af5251ff66193c40685b50cdf3716a0d10796311d11f9f4da72efb8661924814450de79e782b952a845564a4e4871c61be89a07b017b91')
_distdir="CSS-Minifier-XS-0.08"

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
