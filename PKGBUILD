# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-ipc-sysv'
pkgver='2.09'
pkgrel='1'
pkgdesc="System V IPC constants and system calls"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/IPC-SysV'
source=('http://search.cpan.org/CPAN/authors/id/M/MH/MHX/IPC-SysV-2.09.tar.gz')
md5sums=('c573ba407e8981f321ee610edb176225')
sha512sums=('b573b9ce11ebe0a3c89932539513ef11489a954a2a37cfd4eb8ccf10b090697123a9cbcf7c19b307c1b2914450833735eeef27deffe84fc82e75465435014201')
_distdir="IPC-SysV-2.09"

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
