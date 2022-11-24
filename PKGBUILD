# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Alex Kubica <alexkubicail@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-bidi'
pkgver='2.18'
pkgrel='1'
pkgdesc="Perl/CPAN Module Text::Bidi: Unicode bidi algorithm using libfribidi"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('fribidi>=1.0.12' 'perl>=5.10.0')
makedepends=()
url='https://metacpan.org/release/Text-Bidi'
source=("http://search.cpan.org/CPAN/authors/id/K/KA/KAMENSKY/Text-Bidi-$pkgver.tar.gz")
md5sums=('0c005d73ee05ab98bc848c567f10e995')
sha512sums=('07cb29eb4ecb2649b1327a486d6d52af025469762c1944291b35c5e17bde351308bc6aa070e3fd548307131e28c7d00cf231af457353dd683daa16adef1a45d1')
_distdir="Text-Bidi-$pkgver"

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
