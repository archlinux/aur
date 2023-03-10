# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-reply'
pkgver='0.42'
pkgrel='2'
pkgdesc="read, eval, print, loop, yay!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-ini-reader-ordered>=0' 'perl-devel-lexalias>=0' 'perl-eval-closure>=0.11' 'perl-file-homedir>=0' 'perl-module-runtime>=0' 'perl-package-stash>=0' 'perl-padwalker>=0' 'perl-try-tiny>=0' 'perl>=5.006' perl-proc-invoke-editor perl-app-nopaste)
makedepends=()
url='https://metacpan.org/release/Reply'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Reply-0.42.tar.gz')
md5sums=('194495d634db7d8636e42ea49295914a')
sha512sums=('d60a584b3cf676be97bbe199d965a488d6a869b1f6cd55d6b405da3f9c717cf63b4380408a72e6f1e06d3d32a90aa5633889a907d94da147e35804b9d0387662')
_distdir="Reply-0.42"

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
