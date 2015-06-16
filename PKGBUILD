# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-cpan-outdated'
pkgver='0.28'
pkgrel='2'
pkgdesc="detect outdated CPAN modules in your environment."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-distnameinfo>=0.1' 'perl-libwww' 'perl-local-lib>=1.006008' 'perl>=5.8.1')
makedepends=()
url='http://search.mcpan.org/dist/cpan-outdated'
source=('http://search.mcpan.org/CPAN/authors/id/T/TO/TOKUHIROM/cpan-outdated-0.28.tar.gz')
md5sums=('3f0dbeb84a9c854dc31b090f09880f84')
sha512sums=('fa011be0393f1c22685b4ad2ff26a71a3b2ba045fdf489ce40e716dfd6610d718fbcb0769567493b1895232c993ef49ce10fb242a37ad04999aaefe0aa223e59')
_distdir="cpan-outdated-0.28"

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
