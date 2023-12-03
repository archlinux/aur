# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Charles Mauch <cmauch@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-finance-quote'
pkgver='1.58'
pkgrel='2'
pkgdesc="Get stock and mutual fund quotes from various exchanges"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-date-manip>=0' 'perl-date-range>=0' 'perl-date-simple>=0' 'perl-datetime>=0' 'perl-datetime-format-iso8601>=0' 'perl-datetime-format-strptime>=0' 'perl-html-parser>=0' 'perl-html-tableextract>=0' 'perl-html-tokeparser-simple>=0' 'perl-html-tree>=0' 'perl-html-treebuilder-xpath>=0' 'perl-http-cookiejar>=0' 'perl-http-cookies>=0' 'perl-http-message>=0' 'perl-io-string>=0' 'perl-json>=0' 'perl-json-parse' 'perl-lwp-protocol-https>=0' 'perl-mozilla-ca>=0' 'perl-readonly>=0' 'perl-spreadsheet-xlsx>=0' 'perl-string-util>=0' 'perl-text-template>=0' 'perl-try-tiny>=0' 'perl-web-scraper>=0' 'perl-xml-libxml>=0' 'perl-libwww>=0' 'perl>=5.10.1')
checkdepends=('perl-test-kwalitee>=0' 'perl-test-perl-critic>=0' 'perl-test-pod>=0' 'perl-test-pod-coverage>=1.00')
url='https://metacpan.org/release/Finance-Quote'
source=('http://search.cpan.org/CPAN/authors/id/B/BP/BPSCHUCK/Finance-Quote-1.58.tar.gz')
sha512sums=('d14cb997b1cf7ae4442bedfbbe7384d35f3b9d50c1436267c2ce1e30811f018e6a64b62679e4a7d2c150668ec0e3fb20140739ee9e1cdddcf0b90727febcee4c')
_distdir="Finance-Quote-1.58"

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
