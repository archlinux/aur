# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-stat-lsmode'
pkgver='0.50'
pkgrel='1'
pkgdesc="format file modes like the ls -l command does"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Stat-lsMode'
source=('http://search.cpan.org/CPAN/authors/id/M/MJ/MJD/Stat-lsMode-0.50.tar.gz')
md5sums=('bf7e558fd0d668dffb2dcd62d21ef635')
sha512sums=('dec0617efbf65b64d348519e9e591ccf34cd50d857ba253feef8099ffd7bfc6f89f0e57fa90b4c4f3f2f3e02aa07ae66b3aac194276364269b73e5b5dbe8b9f4')
_distdir="Stat-lsMode-0.50"

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
