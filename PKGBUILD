# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Contributor: Elias Elwyn <a@jthv.ai>

pkgname=perl-mp4-info
pkgver=1.13
pkgrel=2
pkgdesc='Fetch info from MPEG-4 files (.mp4, .m4a, .m4p, .3gp)'
_dist=MP4-Info
arch=(any)
url="https://metacpan.org/release/$_dist"
license=(GPL PerlArtistic)
depends=(perl perl-io-string)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/J/JH/JHAR/$_dist-$pkgver.tar.gz")
sha256sums=(54b4511544aae8257c1b03446dde2c8ec6b825ff91e08e5ce5ee7ab0b279fb68)

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
