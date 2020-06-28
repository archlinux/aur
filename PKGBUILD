# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-datetime-format-flexible'
pkgver='0.32'
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
md5sums=('557c8aa64838884857cbce4727d18321')
sha512sums=('90e0e83cecff5daab132860c2da2d77c92c0791fe8d0d6aa9275c1e0d603b644a8531848d8fb4bad8e1800c02a4e571ceda1a4bf4b8ee9bd7ac0215898db2882')
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
