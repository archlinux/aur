# Maintainer: René Wagner < rwagner at rw-net dot de >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-file-rsync'
pkgver='0.49'
pkgrel='1'
pkgdesc="perl module interface to rsync(1) http://rsync.samba.org/rsync/"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ipc-run3' 'rsync')
makedepends=()
url='https://metacpan.org/release/File-Rsync'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEAKIN/File-Rsync-0.49.tar.gz')
sha256sums=('dd995df485f7334796d242efa277586d38d2544cace6ca0c3629a225df1e42d8')
_distdir="File-Rsync-0.49"

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
