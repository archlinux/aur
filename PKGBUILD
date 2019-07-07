# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-daemon'
pkgver='0.22'
pkgrel='1'
pkgdesc="Start an Application as a Daemon"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-pid>=0' 'perl-log-log4perl>=1.0' 'perl-sysadm-install>=0.37')
makedepends=()
url='https://metacpan.org/release/App-Daemon'
source=('https://cpan.metacpan.org/authors/id/M/MS/MSCHILLI/App-Daemon-0.22.tar.gz')
md5sums=('e72c0b280263538af65674011bae7634')
sha512sums=('654d36026bd5a75f10fab2fb6eb0763a3a6f966838350266e3993fb1380d9fd95ba7a261ca6e5c3a0bedcde74d97a2d76865be48687734134fada79fd79d92d0')
_distdir="App-Daemon-0.22"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
