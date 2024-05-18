# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Charles Mauch <cmauch@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-finance-quote'
pkgver='1.62'
pkgrel='1'
pkgdesc="Get stock and mutual fund quotes from various exchanges"
arch=('any')
license=('Artistic-1.0-Perl'
         'GPL-2.0-only')
options=('!emptydirs')
depends=('perl-date-manip>=0' 'perl-date-range>=0' 'perl-date-simple>=0' 'perl-datetime>=0' 'perl-datetime-format-iso8601>=0' 'perl-datetime-format-strptime>=0' 'perl-html-parser>=0' 'perl-html-tableextract>=0' 'perl-html-tokeparser-simple>=0' 'perl-html-tree>=0' 'perl-html-treebuilder-xpath>=0' 'perl-http-cookiejar>=0' 'perl-http-cookies>=0' 'perl-http-message>=0' 'perl-io-string>=0' 'perl-json>=0' 'perl-json-parse' 'perl-lwp-protocol-https>=0' 'perl-mozilla-ca>=0' 'perl-readonly>=0' 'perl-spreadsheet-xlsx>=0' 'perl-string-util>=0' 'perl-text-template>=0' 'perl-try-tiny>=0' 'perl-web-scraper>=0' 'perl-xml-libxml>=0' 'perl-libwww>=0' 'perl>=5.10.1')
checkdepends=('perl-test-kwalitee>=0' 'perl-test-perl-critic>=0' 'perl-test-pod>=0' 'perl-test-pod-coverage>=1.00')
url='https://metacpan.org/release/Finance-Quote'
source=("http://search.cpan.org/CPAN/authors/id/B/BP/BPSCHUCK/Finance-Quote-${pkgver}.tar.gz")
sha512sums=('4c6ba0cdd1f8b562d84a144b0350bc8c60753f7628f2309c6ade01af8357e9693ba7a3fc68976c58c84fce2a51350d57bcd8e0bc046fb60ad0f477c711390139')
_distdir="Finance-Quote-${pkgver}"

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
