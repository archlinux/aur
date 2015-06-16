# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-file-flat'
pkgver='1.04'
pkgrel='1'
pkgdesc="Implements a flat filesystem"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-copy-recursive>=0.35' 'perl-file-remove>=0.38' 'perl-prefork>=0.02')
makedepends=('perl-test-classapi>=1.04')
url='http://search.cpan.org/dist/File-Flat'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/File-Flat-1.04.tar.gz')
md5sums=('20367f74ff34d92b3c839b3da282b4e0')
sha512sums=('5271c45be6ec057247310f74da13c59e9549d1514e13e8111708ca9288439a198dae95a71d561c07afd2ec32663fac436f7b8df1160c3a7f071b597ba12bd789')
_distdir="File-Flat-1.04"

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
