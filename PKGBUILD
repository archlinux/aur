# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Charles Mauch <cmauch@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-finance-quote'
pkgver='1.61'
pkgrel='1'
pkgdesc="Get stock and mutual fund quotes from various exchanges"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-date-manip>=0' 'perl-date-range>=0' 'perl-date-simple>=0' 'perl-datetime>=0' 'perl-datetime-format-iso8601>=0' 'perl-datetime-format-strptime>=0' 'perl-html-parser>=0' 'perl-html-tableextract>=0' 'perl-html-tokeparser-simple>=0' 'perl-html-tree>=0' 'perl-html-treebuilder-xpath>=0' 'perl-http-cookiejar>=0' 'perl-http-cookies>=0' 'perl-http-message>=0' 'perl-io-string>=0' 'perl-json>=0' 'perl-json-parse' 'perl-lwp-protocol-https>=0' 'perl-mozilla-ca>=0' 'perl-readonly>=0' 'perl-spreadsheet-xlsx>=0' 'perl-string-util>=0' 'perl-text-template>=0' 'perl-try-tiny>=0' 'perl-web-scraper>=0' 'perl-xml-libxml>=0' 'perl-libwww>=0' 'perl>=5.10.1')
checkdepends=('perl-test-kwalitee>=0' 'perl-test-perl-critic>=0' 'perl-test-pod>=0' 'perl-test-pod-coverage>=1.00')
url='https://metacpan.org/release/Finance-Quote'
source=('http://search.cpan.org/CPAN/authors/id/B/BP/BPSCHUCK/Finance-Quote-1.61.tar.gz')
sha512sums=('80adc030db5afa882d51d2b651070fc669cefb4566a23d368eaf7c733c8524de3ff016a76d92f3c9ce584b1ed15eb456c1f44449cd8babbaa1aa00473afec5dc')
_distdir="Finance-Quote-1.61"

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
