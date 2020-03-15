# CPAN Name  : String::BufferStack
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-string-bufferstack
pkgver=1.16
pkgrel=2
pkgdesc="Perl module providing a framework for storing nested buffers"
arch=("any")
url="https://metacpan.org/release/String-BufferStack"
license=("PerlArtistic" "GPL")
depends=("perl>=5.8.0")
source=(http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/String-BufferStack-1.16.tar.gz)
options=(!emptydirs)
md5sums=("86bbb4950be7ed63e31e0477a4cd6b1b")

build() {
  cd "$srcdir/String-BufferStack-1.16"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/String-BufferStack-1.16"
  make test
}

package() {
  cd "$srcdir/String-BufferStack-1.16"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
