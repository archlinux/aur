# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-net-amazon-s3'
pkgver='0.60'
pkgrel='1'
pkgdesc="Use the Amazon S3 - Simple Storage Service"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-stream-bulk' 'perl-datetime-format-http' 'perl-digest-hmac' 'perl-digest-md5-file' 'perl-file-find-rule' 'perl-http-date' 'perl-http-message' 'perl-lwp-useragent-determined' 'perl-mime-types' 'perl-moose>=0.85' 'perl-moosex-strictconstructor>=0.16' 'perl-moosex-types-datetime-morecoercions>=0.07' 'perl-path-class' 'perl-regexp-common' 'perl-term-encoding' 'perl-term-progressbar-simple' 'perl-uri' 'perl-xml-libxml' 'perl-libwww')
makedepends=()
checkdepends=('perl-test-exception')
url='https://metacpan.org/release/Net-Amazon-S3'
source=('http://search.cpan.org/CPAN/authors/id/P/PF/PFIG/Net-Amazon-S3-0.60.tar.gz')
md5sums=('652bfee36dbb2c21e8e5633961db7780')
sha512sums=('b24fdf4061950df2eac2a03bf28cd6bd648a815f60930322c0d9159f49315feace747d9870b9f117f5f76298fccb006c076333bb427d65ff437e6d89ee754176')
_distdir="Net-Amazon-S3-0.60"

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
