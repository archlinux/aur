# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-datetime-format-flexible'
pkgver='0.30'
pkgrel='1'
pkgdesc="Perl/CPAN Module DateTime::Format::Flexible: Flexibly parse strings and turn them into DateTime objects."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime' 'perl-datetime-format-builder>=0.74' 'perl-datetime-timezone' 'perl-list-moreutils' 'perl-module-pluggable')
makedepends=()
checkdepends=('perl-test-exception' 'perl-test-mocktime' 'perl-test-nowarnings')
url='https://metacpan.org/release/DateTime-Format-Flexible'
source=("http://search.cpan.org/CPAN/authors/id/T/TH/THINC/DateTime-Format-Flexible-$pkgver.tar.gz")
md5sums=('192315e122aeb050ec2ed0440bfc70a7')
sha512sums=('647f071c43e611fcdc462df2de429d11460b95c0ea4d59705817c53c57d500b9146125cf026e659f9128ce35142078bb58d97432e4488ee90f635e514ee40435')
_distdir="DateTime-Format-Flexible-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
