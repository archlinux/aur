# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-fennec-lite'
pkgver='0.004'
pkgrel='1'
pkgdesc="Minimalist Fennec, the commonly used bits."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.cpan.org/dist/Fennec-Lite'
source=('http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Fennec-Lite-0.004.tar.gz')
md5sums=('e0a373981c6758490667fffc6bca8156')
sha512sums=('507b58a0f7f1efb4f46b615f3bdd28666b52bffe35376afe07341074c8051032d0650a35afe884e8e603de1b63653763e1f0501d7f390fea14fbebc0eb4fa8af')
_distdir="Fennec-Lite-0.004"

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
