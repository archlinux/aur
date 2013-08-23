# CPAN Name  : Email::LocalDelivery
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-email-localdelivery
pkgver=0.217
pkgrel=1
pkgdesc="Perl module to deliver an email to a list of mailboxes"
arch=("any")
url="http://search.cpan.org/dist/Email-LocalDelivery"
license=("PerlArtistic" "GPL")
depends=("perl" "perl-email-foldertype>=0.7" "perl-email-simple>=1.998" "perl-file-path-expand>=1.01")
source=(http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-LocalDelivery-0.217.tar.gz)
options=(!emptydirs)
md5sums=("10c70424179010bf9fb2f1b03ab92527")

build() {
  cd "$srcdir/Email-LocalDelivery-0.217"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Email-LocalDelivery-0.217"
  make test
}

package() {
  cd "$srcdir/Email-LocalDelivery-0.217"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
