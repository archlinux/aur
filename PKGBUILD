# CPAN Name  : String-Interpolate
# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-string-interpolate'
pkgver='0.32'
pkgrel='1'
pkgdesc="Wrapper for builtin the Perl interpolation engine."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-padwalker>=0' 'perl-safe-hole>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/String-Interpolate'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/String-Interpolate-0.32.tar.gz')
md5sums=('0ea13c3b89da1dcfa437b5a70332960f')
sha512sums=('a782ec8e1084fec291342d61a68edd4d43c647aefa693923e7548f001c5f7aead27ba6721d6054fef051041af3b0beac5e9b07de88c63220c257be72fb720e93')
_distdir="String-Interpolate-0.32"

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
