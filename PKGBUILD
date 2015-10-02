# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-file-rsync'
pkgver='0.48'
pkgrel='1'
pkgdesc="perl module interface to rsync(1) http://rsync.samba.org/rsync/"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ipc-run3' 'rsync')
makedepends=()
url='https://metacpan.org/release/File-Rsync'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEAKIN/File-Rsync-0.48.tar.gz')
md5sums=('3a1085ca8995e5804c8f0ac4f0d72881')
sha512sums=('ced69d97a497e02ad357491a0cbe1cc2be12bacc05db1f86dd10d61787e2ad8ef7ed1c6171a69862a67182f875d724b9c51096500d3d6f079fc39f529268353f')
_distdir="File-Rsync-0.48"

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
