# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: xduugu <xduugu@gmx.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-spreadsheet-parseexcel'
pkgver='0.66'
pkgrel='2'
pkgdesc="Read information from an Excel file."
arch=('any')
license=('Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl-crypt-rc4>=0' 'perl-digest-perl-md5>=0' 'perl-io-stringy>=0' 'perl-ole-storage-lite>=0.19' 'perl-spreadsheet-writeexcel')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-ParseExcel'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/Spreadsheet-ParseExcel-0.66.tar.gz')
md5sums=('091aa6a1be43a60f4c81b43f5afafd06')
sha512sums=('d63070eadcd32bef19a756a39b960fdd067c18848d30110cd2c055110eac4737db3cbf856ee6cb40860bd4e2abe12069aecc110b90f805c8e1fb5ac991b9c8e3')
_distdir="Spreadsheet-ParseExcel-0.66"

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
