# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dist-zilla-plugin-hasversiontests'
pkgver='1.101420'
pkgrel='1'
pkgdesc="Release tests for version numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla' 'perl-moose')
makedepends=('perl-test-hasversion')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-HasVersionTests'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARCEL/Dist-Zilla-Plugin-HasVersionTests-1.101420.tar.gz')
md5sums=('36a8dcfe262d234ae9f854530b755d8b')
sha512sums=('3142befba31d1e05c64e953c597792db975cb0ba439240e48b0779c91a0384fc70668c06fde4199500b6b46b124debee2a93516c1db3be6b391e43feca9be909')
_distdir="Dist-Zilla-Plugin-HasVersionTests-1.101420"

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
