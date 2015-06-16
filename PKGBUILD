# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-gtk3'
pkgver='0.021'
pkgrel='1'
pkgdesc="Perl interface to the 3.x series of the gtk+ toolkit"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cairo-gobject>=1.000' 'perl-glib-object-introspection>=0.016')
makedepends=()
url='http://search.mcpan.org/dist/Gtk3'
source=('http://search.mcpan.org/CPAN/authors/id/X/XA/XAOC/Gtk3-0.021.tar.gz')
md5sums=('c8813ad522bf75af4126796d6b6418c2')
sha512sums=('c6d53e96191a60f645e87260e10b53b5be340b5a3b15d11d6453b958c5b02b275931d8b558c82b4a6cbbb5f0fb403d0c81754e2f44b98681a598718f00555633')
_distdir="Gtk3-0.021"

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
