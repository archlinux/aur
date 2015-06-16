# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-aws-s3'
pkgver='0.031'
pkgrel='1'
pkgdesc="Lightweight interface to Amazon S3 (Simple Storage Service)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load' 'perl-digest-hmac' 'perl-http-date' 'perl-iterator-paged' 'perl-lwp-useragent-determined' 'perl-uri' 'perl-vso>=0.024' 'perl-xml-libxml')
makedepends=()
url='http://search.cpan.org/dist/AWS-S3'
source=('http://search.cpan.org/CPAN/authors/id/J/JO/JOHND/AWS-S3-0.031.tar.gz')
md5sums=('1d6983712df3eeca4c31d6622f1a85f6')
sha512sums=('8c077f91244a0c525f9544a9347abfe88192faa3e5f8cb697ad59246040d38029064ce1801979b16d6a11eb129ec242a25901a5e3b54a269256b0db9e132fb77')
_distdir="AWS-S3-0.031"

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
