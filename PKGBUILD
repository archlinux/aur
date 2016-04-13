# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-glib-object-introspection'
pkgver='0.040'
pkgrel='1'
pkgdesc="Dynamically create Perl language bindings"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glib-perl>=1.32' 'glib2>=2.48.0' 'gobject-introspection-runtime>=1.48.0' 'libffi>=3.2.1' 'perl-extutils-depends>=0.3' 'perl-extutils-pkgconfig')
makedepends=()
url='https://metacpan.org/release/Glib-Object-Introspection'
source=('http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Glib-Object-Introspection-0.040.tar.gz')
md5sums=('df8329c498da77677d58ef337a75fa6d')
sha512sums=('bd5e4db8b6e331fb9641e75a50a95fff1a823597a8e4c4e9f99a81e7aa2ee30d93856c56ecfea3785b8719dba6590169bcd006ea06d97170889091e6b9480e9f')
_distdir="Glib-Object-Introspection-0.040"

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
