# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-file-rsync'
pkgver='0.43'
pkgrel='1'
pkgdesc="Wrapper module for rsync(1) http://rsync.samba.org/"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/File-Rsync'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEAKIN/File-Rsync-0.43.tar.gz')
md5sums=('fe745f0460454250bc4ed557de8f11ac')
sha512sums=('b23d4305609eb7d21a19b2e45cd47eb57d3b71aaad741cc5f7457d1826e0509cafa0555975345afc11b5342f19621558940e513be2b17575f322469f732534cd')
_distdir="File-Rsync-0.43"

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
