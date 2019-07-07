# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sysadm-install'
pkgver='0.48'
pkgrel='1'
pkgdesc="Typical installation tasks for system administrators"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-which>=1.09' 'perl-log-log4perl>=1.28' 'perl-term-readkey>=0' 'perl-libwww>=0')
makedepends=()
optdepends=('perl-expect')
url='https://metacpan.org/release/Sysadm-Install'
source=('https://cpan.metacpan.org/authors/id/M/MS/MSCHILLI/Sysadm-Install-0.48.tar.gz')
md5sums=('a7deeb1a71e7da46445e33a3ed12874b')
sha512sums=('be2a00c8f849891f4f184bc15d6c7520fcf7ba828c40ed1dbc55566f2d134232d79687417a9a78a405e37f89c877e759e3788226823491de5f970105950e0bd2')
_distdir="Sysadm-Install-0.48"

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
