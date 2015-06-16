# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cache'
pkgver='2.04'
pkgrel='1'
pkgdesc="the Cache interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-sha1>=2.01' 'perl-file-nfslock>=1.2' 'perl-heap' 'perl-io-string>=1.02' 'perl-timedate')
makedepends=()
url='http://search.cpan.org/dist/Cache'
source=('http://search.cpan.org/CPAN/authors/id/C/CL/CLEISHMAN/Cache-2.04.tar.gz')
md5sums=('c64b8dd8f04e101bd20cde0c7c2e3d17')
sha512sums=('ebdb328313e1b420889aff567f7745ec059ff8aba9ddb5e184cf3f636e557b1b3fc04dd0c3be33493b344e7af31a9fbafab755742360ca41ff83165ac5bf3722')
_distdir="Cache-2.04"

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
