# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-stacktrace-ashtml'
pkgver='0.15'
_distdir="Devel-StackTrace-AsHTML-${pkgver}"
pkgrel='2'
pkgdesc="Perl/CPAN Module Devel::StackTrace::AsHTML: Displays stack trace in HTML"
arch=('any')
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-devel-stacktrace' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Devel-StackTrace-AsHTML'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/${_distdir}.tar.gz")
md5sums=('4ec8bd92e4a765a7cabf402db9640412')
sha512sums=('aa81f3b88e27c83e1f8a51981b201edd9cecaa0430a16f72f0a05d323d77e9ede21c4629a40779ea5e2aa5759ecc0d9cecf67a81e752b4a82d360f23561933ce')

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
