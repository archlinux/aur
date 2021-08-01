# Maintainer: Michael Gerdau <mgd@qata.de>
# Contributor: xduugu <xduugu@gmx.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-spreadsheet-parseexcel'
pkgver='0.65'
pkgrel='2'
pkgdesc="Read information from an Excel file."
_realname='Spreadsheet-ParseExcel'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-crypt-rc4>=0' 'perl-digest-perl-md5>=0' 'perl-io-stringy>=0' 'perl-ole-storage-lite>=0.19')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-ParseExcel'
source=("http://search.cpan.org/CPAN/authors/id/D/DO/DOUGW/${_realname}-${pkgver}.tar.gz")
md5sums=('4b8857e3a391d86501c1b742b459ac9e')
sha512sums=('a57be764a9781d1e219d1aab940a9b834d1ddf90ebb4966eaeba86afea3de03617fbdeda67d9bc2bedd8651cc3feafd46905021150bbcd68cbc7453865877637')
_distdir="${_realname}-${pkgver}"

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
