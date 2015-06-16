# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-mojolicious-plugin-ttrenderer'
pkgver='1.56'
pkgrel='1'
pkgdesc="Template Renderer Plugin for Mojolicious"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=5.81' 'perl-template-toolkit')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-TtRenderer'
source=('http://search.cpan.org/CPAN/authors/id/P/PL/PLICEASE/Mojolicious-Plugin-TtRenderer-1.56.tar.gz')
md5sums=('f402272e7182be65702a1199d792d1ff')
sha512sums=('63345df71c2bc99a8b3f424787fe24e874d75857d5c2a770602e80aae5b31899725dec8eaf9370e8291c1b688aa76c7b3eb8b0d6aa524427d0b30b0f29116045')
_distdir="Mojolicious-Plugin-TtRenderer-1.56"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
