# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-email-foldertype
pkgver=0.813
pkgrel=1
pkgdesc="Perl module to determine the type of a mail folder"
arch=("any")
url="http://search.cpan.org/dist/Email-FolderType/"
license=("GPL" "PerlArtistic")
depends=("perl>=5.8.9")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-FolderType-$pkgver.tar.gz)
md5sums=("4d33367e38ec1548737c15ccd200f18c")

build() {
  cd "$srcdir/Email-FolderType-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {  
  cd "$srcdir/Email-FolderType-$pkgver"
  make test
}

package() {
  cd "$srcdir/Email-FolderType-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
