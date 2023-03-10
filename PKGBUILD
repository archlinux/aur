# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-pastebin-pastebincom-create'
pkgver='1.003'
pkgrel='1'
pkgdesc="paste on www.pastebin.com without API keys"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=1.004001' 'perl-www-mechanize>=1.73')
makedepends=()
url='https://metacpan.org/release/WWW-Pastebin-PastebinCom-Create'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZO/ZOFFIX/WWW-Pastebin-PastebinCom-Create-1.003.tar.gz')
md5sums=('9c8fec1d38e0afe3dbdf7d0d843a5796')
sha512sums=('6388477145578fbe0478463884fe5cb3240c153e486dda48e9e54ead47d2ef75b22e65476241a9e834c66609427bed53d0c269b62d8575ac4af3eba6f8b93fe9')
_distdir="WWW-Pastebin-PastebinCom-Create-1.003"

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

# check() {
#   cd "$srcdir/$_distdir"
#   ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
#     make test
#   )
# }

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
