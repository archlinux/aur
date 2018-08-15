# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cache'
pkgver='2.11'
pkgrel='1'
pkgdesc="Perl/CPAN Module Cache: the Cache interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.12' 'perl-file-nfslock>=1.20' 'perl-heap' 'perl-io-string>=1.02' 'perl-timedate')
makedepends=()
url='https://metacpan.org/release/Cache'
source=("http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Cache-${pkgver}.tar.gz")
md5sums=('86dff7867e417e89105f2616425c30a2')
sha512sums=('cee1069bef2fbc19d6836181e6fda8eb479207864063ddb40ad009b5f4cd9be9e774a0a88311b4205439303a59426c349f4d875a5d417fc211e150942592a6c4')
_distdir="Cache-2.11"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
