# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-pod-webserver'
pkgver='3.05'
pkgrel='1'
pkgdesc="a miniature web server for reading Pod in web browsers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Pod-Webserver'
source=('http://search.cpan.org/CPAN/authors/id/A/AR/ARANDAL/Pod-Webserver-3.05.tar.gz')
md5sums=('99f47207edf23b5adb3a607348adb8ca')
sha512sums=('7268e5d1748d175ad342bf04612a0d4cc77a4d4f1914b1d96d7fa4330490439cc8da1da8d9a0f20b765a8c2079e36a20f2163656154d635163b89dd36b76c8bc')
_distdir="Pod-Webserver-3.05"

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
