# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-gtk2-ex-simple-list'
pkgver='0.50'
pkgrel='2'
pkgdesc="A simple interface to Gtk2's complex MVC list widget"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gtk2-perl' 'glib-perl')
makedepends=()
url='https://metacpan.org/release/Gtk2-Ex-Simple-List'
source=("http://www.cpan.org/modules/by-module/Gtk2/RMCFARLA/Gtk2-Perl-Ex/Gtk2-Ex-Simple-List-${pkgver}.tar.gz")
md5sums=('f66c71bbb794b699f0c3e8ca7cebc35b')
sha512sums=('df57509eb386aff41630b7da2d9b810b1e9308dec407dbe792a4282f2d7331cb3639755af8232bf6312e0537784dab5f1d035c919909a53e584173ce24aa6a09')
_distdir="Gtk2-Ex-Simple-List-${pkgver}"

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
