# CPAN Name  : Clipboard
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-clipboard
pkgver=0.13
pkgrel=3
pkgdesc="Perl clipboard module"
arch=("any")
url="http://search.cpan.org/dist/Clipboard"
license=("PerlArtistic" "GPL")
depends=("perl>=5.6.0" "xclip")
source=(http://search.cpan.org/CPAN/authors/id/K/KI/KING/Clipboard-0.13.tar.gz)
options=(!emptydirs)
md5sums=("691e17df1d4c074284c85abac6c0c973")

build() {
  cd "$srcdir/Clipboard-0.13"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Clipboard-0.13"
  make test
}

package() {
  cd "$srcdir/Clipboard-0.13"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
