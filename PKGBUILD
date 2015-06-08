# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-imap-client'
pkgver='0.13'
pkgrel='1'
pkgdesc="Full IMAP client library w/ referral support"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-ssl' 'perl-uri' 'perl-uri-imap')
makedepends=()
url='http://search.cpan.org/dist/IMAP-Client'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CONTEB/IMAP-Client-0.13.tar.gz')
md5sums=('f0a343d8110977788471459c0397e697')
sha512sums=('37cd0bf019ff3d699917e92e312acf640dae459dd221fe06faa513ec23c6b754d723d0f19871c6b8fb0294d8ba66b355fcc29fddbce0d98cc676ab790be479a1')
_distdir="IMAP-Client-0.13"

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
