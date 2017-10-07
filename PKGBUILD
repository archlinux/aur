# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-csrf'
pkgver='1.00'
pkgrel='1'
pkgdesc="Perl/CPAN Module WWW::CSRF: Generate and check tokens to protect against CSRF attacks"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-bytes-random-secure' 'perl-digest-hmac')
makedepends=()
url='https://metacpan.org/release/WWW-CSRF'
source=('http://search.cpan.org/CPAN/authors/id/S/SE/SESSE/WWW-CSRF-1.00.tar.gz')
md5sums=('f491c4df03f31cc413bde31c26c1fa27')
sha512sums=('593d5f0352a7ee9a15dc31870c9ab775f71abe0a24aae5b7329e53f6283aa1c4774a8d6d1669036e9fd07cc040df3e857b12543f6732269e37984530604f64f5')
_distdir="WWW-CSRF-1.00"

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
