# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-gtk3-webkit'
pkgver='0.06'
pkgrel='1'
pkgdesc="WebKit bindings for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-glib-object-introspection' 'perl-gtk3')
makedepends=()
checkdepends=('perl-test-needsdisplay')
url='https://metacpan.org/release/Gtk3-WebKit'
source=('http://search.cpan.org/CPAN/authors/id/P/PO/POTYL/Gtk3-WebKit-0.06.tar.gz')
md5sums=('4fe6ebbef518c099026a3f0362990ab0')
sha512sums=('e14f1101b991fd1623a5a1074b4b0581e75519f00b1af87daddbb6ebf998e9efdf004d6e421f2fd196b95428cf373cf3c516638f2f81bc67c8f1f33ee5afbf30')
_distdir="Gtk3-WebKit-0.06"

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
