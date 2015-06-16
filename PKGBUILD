# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-session-state-cookie'
pkgver='0.17'
pkgrel='1'
pkgdesc="Maintain session IDs using cookies."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-plugin-session>=0.27' 'perl-catalyst-runtime' 'perl-mro-compat' 'perl-namespace-autoclean')
makedepends=('perl-moose')
url='http://search.cpan.org/dist/Catalyst-Plugin-Session-State-Cookie'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSTROUT/Catalyst-Plugin-Session-State-Cookie-0.17.tar.gz')
md5sums=('f2a2d43d80777ceb2687b9e682cf5c76')
sha512sums=('29040a1b6be47152b1604d20d5adcfc38e7b23ec4ab2fa8b8897e64ae294d4a220b0ab53bad69ecc5c0b7ac2982001a032f4fd93ca3f55e1588d4e5ab3721ddc')
_distdir="Catalyst-Plugin-Session-State-Cookie-0.17"

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
