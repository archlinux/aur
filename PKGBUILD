# CPAN Name  : Email::Outlook::Message
# Maintainer: Jose Riha <jose 1711 at gmail dot com>
# Contributor: zman0900
# Contributor: bidulock
pkgname=perl-email-outlook-message
pkgver=0.919
pkgrel=2
pkgdesc="Perl module to read Outlook .msg files"
arch=("any")
url="http://search.cpan.org/dist/Email-Outlook-Message/"
license=("PerlArtistic" "GPL")
depends=("perl" "perl-io-string" "perl-ole-storage-lite" "perl-email-mime-contenttype" "perl-email-mime" "perl-email-sender" "perl-mro-compat" "perl-module-pluggable")
source=(http://search.cpan.org/CPAN/authors/id/M/MV/MVZ/Email-Outlook-Message-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('64d04df4922948ff57872f7078efbbb0')

build() {
  cd "$srcdir/Email-Outlook-Message-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Email-Outlook-Message-${pkgver}"
  make test
}

package() {
  cd "$srcdir/Email-Outlook-Message-${pkgver}"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
