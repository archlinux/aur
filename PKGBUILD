# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-amazon-s3'
pkgver='0.45'
pkgrel='1'
pkgdesc="A portable client library for working with and"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor' 'perl-digest-hmac' 'perl-digest-md5-file' 'perl-http-date' 'perl-lwp-useragent-determined' 'perl-uri' 'perl-xml-simple>=1.08')
makedepends=()
url='http://search.cpan.org/dist/Amazon-S3'
source=('http://search.cpan.org/CPAN/authors/id/T/TI/TIMA/Amazon-S3-0.45.tar.gz')
md5sums=('a055ab8fd27d86ddc65a216145391793')
sha512sums=('69096502afc1ec66ff691d13cac3126b6f3423b5240857809db8f910f4ffa0cc712573f05c39979306e84d918bade44c26e4144e23e75bd8318cdc1ac918f4ee')
_distdir="Amazon-S3-0.45"

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
