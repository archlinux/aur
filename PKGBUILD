# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-file-util'
pkgver='4.131591'
pkgrel='1'
pkgdesc="Easy, versatile, portable file handling"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-nowarnings')
url='http://search.cpan.org/dist/File-Util'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOMMY/File-Util-4.131591.tar.gz')
md5sums=('375676589ff8c93785cc8c9110fe00a8')
sha512sums=('61953b4bb375194ad5189169697616c24bf82afb20dd57ef0eb540cfec4eddd32dd522e77bcb47eb9c4117113a61127303f615f6722ac33fccdcbe7a2c44f21c')
_distdir="File-Util-4.131591"

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
