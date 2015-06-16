# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-gtk2-ex-podviewer'
pkgver='0.18'
pkgrel='2'
pkgdesc="a Gtk2 widget for displaying Plain old Documentation (POD)."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gtk2-perl' 'perl-io-stringy' 'perl-gtk2-ex-simple-list')
makedepends=()
url='http://search.mcpan.org/dist/Gtk2-Ex-PodViewer'
source=('http://search.mcpan.org/CPAN/authors/id/G/GB/GBROWN/Gtk2-Ex-PodViewer-0.18.tar.gz')
md5sums=('09faddfde815e88e49d4ba61fd5469b9')
sha512sums=('488c83a95776f0d54d92bc45abc7b1727d76930a16d16c203865ecd9e9274340f59fe2916ceb16fed0babc8b531cad625cfd549ff9914321440e14ea81c49893')
_distdir="Gtk2-Ex-PodViewer-0.18"

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
