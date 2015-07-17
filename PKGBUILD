# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-glib-object-introspection'
pkgver='0.028'
pkgrel='2'
pkgdesc="Dynamically create Perl language bindings"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glib-perl>=1.28' 'glib2>=2.42.2' 'gobject-introspection>=1.42.0' 'libffi>=3.2.1' 'perl-extutils-depends>=0.3' 'perl-extutils-pkgconfig')
makedepends=()
url='http://search.mcpan.org/dist/Glib-Object-Introspection'
source=('http://search.mcpan.org/CPAN/authors/id/X/XA/XAOC/Glib-Object-Introspection-0.028.tar.gz')
md5sums=('69452323451b8260339ffd00e375dd25')
sha512sums=('5754e012b2330e7533f06056cfee377cad380b4938e0c92d744321dacf65688cc96797e3eaf500632df24a5d6bd495281a79f915ed970d95b474f688c63850b2')
_distdir="Glib-Object-Introspection-0.028"

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
