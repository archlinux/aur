# CPAN Name  : String::BufferStack
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-string-bufferstack
pkgver=1.16
pkgrel=1
pkgdesc="Perl module providing a framework for storing nested buffers"
arch=("any")
url="http://search.cpan.org/dist/String-BufferStack"
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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
