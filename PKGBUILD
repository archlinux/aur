# CPAN Name  : Email::LocalDelivery
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-email-localdelivery
pkgver=1.200
pkgrel=2
pkgdesc='Perl module to deliver an email to a list of mailboxes'
arch=('any')
url='https://metacpan.org/release/Email-LocalDelivery'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8' 'perl-email-foldertype>=0.7' 'perl-email-simple>=1.998' 'perl-file-path-expand>=1.01')
checkdepends=('perl>=5.13.4' 'perl-capture-tiny')
source=(http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-LocalDelivery-1.200.tar.gz)
options=(!emptydirs)
md5sums=('6218c960f8f426b5c20a64b3fb7a6bf4')

build() {
  cd Email-LocalDelivery-1.200
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Email-LocalDelivery-1.200
  make test
}

package() {
  cd Email-LocalDelivery-1.200
  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
