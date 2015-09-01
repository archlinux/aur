# Contributor: Christos Nouskas <nous@archlinux.us>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-uri-fromhash'
pkgver='0.04'
pkgrel='1'
pkgdesc="Build a URI from a set of named parameters"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-params-validate>=0' 'perl-uri>=0')
makedepends=()
url='https://metacpan.org/release/URI-FromHash'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/URI-FromHash-0.04.tar.gz')
md5sums=('2034041b86ac2a71fb7b488d6f0370f8')
sha512sums=('f97a7001d4812eaea79604d31e8a490287924e6ba3aaef94c4b716f5aecb5444fd1573e7daba3ee3b1d4447e367f13f3f2e38fad3d8df65da581bcace4e1883d')
_distdir="URI-FromHash-0.04"

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
