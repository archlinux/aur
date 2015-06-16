# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-gtk2-spell'
pkgver='1.04'
pkgrel='1'
pkgdesc="Bindings for GtkSpell with Gtk2"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('atk>=2.8.0' 'cairo>=1.12.14' 'fontconfig>=2.10.93' 'freetype2>=2.5.0.1' 'gdk-pixbuf2>=2.28.2' 'glib2>=2.36.3' 'gtk2>=2.24.20' 'gtkspell>=2.0.16' 'pango>=1.34.1' 'perl')
makedepends=()
url='http://search.cpan.org/dist/Gtk2-Spell'
source=('http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/Gtk2-Spell-1.04.tar.gz')
md5sums=('c6cb96840b8ccd48de160034f8d04252')
sha512sums=('b0f71158e56efe561e9999066e896c92b90e9b046e6193fe0b96b4b8fbd4d10d9fc906b9313b4c5c5fbc93cdd33b710eea3170a9677bcdea46fa22032d19b960')
_distdir="Gtk2-Spell-1.04"

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
