# Contributor: Christos Nouskas <nous@artixlinux.org>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lwp-useragent-tor'
pkgver='0.06'
pkgrel='1'
pkgdesc="rotate your ips"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-mmagic>=0' 'perl-file-which>=0' 'perl-lwp-protocol-socks>=0' 'perl-path-tiny>=0' 'perl-proc-background>=0' 'perl-test-tcp>=0' 'perl-libwww>=0' 'perl>=5.01')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/LWP-UserAgent-Tor'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPEBERN/LWP-UserAgent-Tor-0.06.tar.gz')
md5sums=('097eb659f7acc5590b04733dc87aaa50')
sha512sums=('4437118e6362910ab19382470cb1e2cb55dfc34cc7d6f0ea506c1d6dae5813c5a3dc76eb53d91b0b8f473fcd6e0a47060152e099f96f58ff1a98d0bdd2d4e16f')
_distdir="LWP-UserAgent-Tor-0.06"

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
