# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-gtk2-gladexml-simple'
pkgver='0.32'
pkgrel='1'
pkgdesc="A clean object-oriented interface to Gtk2::GladeXML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glade-perl' 'gtk2-perl' 'perl')
makedepends=()
url='http://search.cpan.org/dist/Gtk2-GladeXML-Simple'
source=('http://search.cpan.org/CPAN/authors/id/A/AM/AMNESIAC/Gtk2-GladeXML-Simple-0.32.tar.gz')
md5sums=('cfb8560e8a3e8bca07c9c8157c361799')
sha512sums=('6fa86ecd21baf8b8015469587134c210793e33dea622215f78052eae3b18ada381c2d06df284ad1bd8a97caca3af16dcbc1fc443c78c0e65d56bc78d6f5ae212')
_distdir="Gtk2-GladeXML-Simple-0.32"

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
