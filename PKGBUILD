# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-sys-statistics-linux'
pkgver='0.66'
pkgrel='1'
pkgdesc="Front-end module to collect system statistics"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-universal-require')
makedepends=()
url='http://search.cpan.org/dist/Sys-Statistics-Linux'
source=('http://search.cpan.org/CPAN/authors/id/B/BL/BLOONIX/Sys-Statistics-Linux-0.66.tar.gz')
md5sums=('7bfc6ce644df994fdcefc3b63d529778')
sha512sums=('0387e7746d923860e5d9362f3259c19fc2e173cf6199aae11238a9bc0b588afe05026a876592845e0ac12f445cfb2c38ff7646fe9beed5807548179c7b2754b4')
_distdir="Sys-Statistics-Linux-0.66"

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
