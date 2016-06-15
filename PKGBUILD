# Maintainer: Jenic Rycr <jenic[at]goos[dot]es>

_pkgname=Text-Levenshtein-Damerau
pkgname=perl-text-levenshtein-damerau
pkgver=0.41
pkgrel=1
pkgdesc="PP Damerau Levenshtein edit distance"
arch=("any")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=('perl')
url="http://search.cpan.org/~ugexe/Text-Levenshtein-Damerau/"
source=("http://search.cpan.org/CPAN/authors/id/U/UG/UGEXE/$_pkgname-$pkgver.tar.gz")
md5sums=('229a13abff9f16d140f65ccf053df59b')
sha1sums=('8d4462016c89bd8f881d75d955a910d6857ecd5d')
sha256sums=('3e7d14fa97f31f4862eaf24fa5fa24892aaeb7b363e15222dcdcc82a7caf5e50')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
