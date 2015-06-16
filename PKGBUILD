# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-www-menugrinder'
pkgver='0.06'
pkgrel='1'
pkgdesc="A tool for managing dynamic website menus."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.34' 'perl-xml-simple')
makedepends=()
url='http://search.cpan.org/dist/WWW-MenuGrinder'
source=('http://search.cpan.org/CPAN/authors/id/A/AR/ARODLAND/WWW-MenuGrinder-0.06.tar.gz')
md5sums=('551959080bb2dd4fcd3d629166f26f54')
sha512sums=('ca8bc85e22ec234f9209b56bab4a6731957cf3487d409316359d75be461b65cfb485f4ea79163a3eef8fa2a9ed91d29d4aacfe0beafd5aef5e6e9fce47f79f7f')
_distdir="WWW-MenuGrinder-0.06"

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
