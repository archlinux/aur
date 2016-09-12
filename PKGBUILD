# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-keepass'
pkgver='2.03'
pkgrel='4'
pkgdesc="Interface to KeePass V1 and V2 database files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-crypt-rijndael>=1.0')
makedepends=()
url='https://metacpan.org/release/File-KeePass'
source=('http://search.cpan.org/CPAN/authors/id/R/RH/RHANDOM/File-KeePass-2.03.tar.gz')
md5sums=('085da6ef1ada886ca3e9b8724fc213b3')
sha512sums=('f50cdcc52e3f4eb9da17e9e823ae268547f9fafaa534bdc52db1da53564fcc28ebf975e71b9968b5cad617f2964ed3c55022063bc52f910d2478d06ce35d4ba1')
_distdir="File-KeePass-2.03"

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
