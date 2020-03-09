# CPAN Name  : File::Policy
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-file-policy
pkgver=1.005
pkgrel=2
pkgdesc="Perl module providing site policy for file I/O functions"
arch=("any")
url="https://metacpan.org/release/File-Policy"
license=("GPL")
depends=("perl" "perl-file-slurp")
checkdepends=("perl-log-trace" "perl-test-assertions")
source=(http://search.cpan.org/CPAN/authors/id/B/BB/BBC/File-Policy-1.005.tar.gz)
options=(!emptydirs)
md5sums=("735ee869bf623861724bd3960f482e0d")

build() {
  cd "$srcdir/File-Policy-1.005"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/File-Policy-1.005"
  make test
}

package() {
  cd "$srcdir/File-Policy-1.005"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
