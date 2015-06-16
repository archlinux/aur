# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-file-stat-modestring'
pkgver='1.00'
pkgrel='1'
pkgdesc="conversion file stat(2) mode to/from string representation."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-stat-bits')
makedepends=()
url='http://search.cpan.org/dist/File-Stat-ModeString'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FEDOROV/File-Stat-ModeString-1.00.tar.gz')
md5sums=('65cef1f813a678911ed4168b22651c35')
sha512sums=('170f1dc21f04d828e0a06fd7fcc0cbdaefdc5d4be95f87c6b6563ce1c679db18c009d2f811ae78927420a1fb93c70e6365ec949dae8d6c78cb8ee0f1bd44d73b')
_distdir="File-Stat-ModeString-1.00"

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
