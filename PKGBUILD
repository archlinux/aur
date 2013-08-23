# CPAN Name  : Email::MIME::CreateHTML
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.13

pkgname=perl-email-mime-createhtml
pkgver=1.030
pkgrel=1
pkgdesc="Perl module that allows you to create HTML emails"
arch=("any")
url="http://search.cpan.org/dist/Email-MIME-CreateHTML"
license=("GPL")
depends=("perl" "perl-data-serializer" "perl-email-mime" "perl-file-policy" "perl-html-tagset" "perl-html-tokeparser-simple>=3.15" "perl-mime-types")
makedepends=("perl-test-assertions")
source=(http://search.cpan.org/CPAN/authors/id/B/BB/BBC/Email-MIME-CreateHTML-1.030.tar.gz)
options=(!emptydirs)
md5sums=("96d9913a62ff1a8621ecd63b6f743cab")

build() {
  cd "$srcdir/Email-MIME-CreateHTML-1.030"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Email-MIME-CreateHTML-1.030"
  make test
}

package() {
  cd "$srcdir/Email-MIME-CreateHTML-1.030"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
