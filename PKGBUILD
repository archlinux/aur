# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-net-uftp'
pkgver='0.161'
pkgrel='1'
pkgdesc="Universal interface for FTP-like modules (FTP, SFTP, SCP), in most cases Net::FTP compatible."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-fast-xs' 'perl-file-stat-modestring' 'perl-net-ftp-autoreconnect' 'perl-net-ssh2' 'perl-universal-require')
makedepends=()
url='http://search.mcpan.org/dist/Net-uFTP'
source=('http://search.mcpan.org/CPAN/authors/id/S/ST/STRZELEC/Net-uFTP-0.161.tar.gz')
md5sums=('6c4ecf439ae6524c1d1bbad6e74f1577')
sha512sums=('ed1db443db35d80b8433b039d5faca35bc371bcc67b3c3747750d70a903d7c102b2720d66c92ea0ac68a95abf66c40466dd32bdc0fd323346a8f57295b3bddb5')
_distdir="Net-uFTP-0.161"

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
