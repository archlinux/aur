# Maintainer: Aaron Bishop <erroneous@gmail.com>

pkgname=perl-crypt-openssl-aes
pkgver=0.10
pkgrel=1
pkgdesc="Perl/CPAN Module Crypt::OpenSSL::AES"
arch=('x86_64' 'i686')
url="https://metacpan.org/pod/Crypt::OpenSSL::AES"
license=("GPL" "PerlArtistic")
depends=("curl" "openssl" "perl-crypt-openssl-guess")
#checkdepends=("perl-crypt-cbc" "perl-crypt-pbkdf2" "perl-crypt-mode-cbc" "perl-crypt-mode-ecb" "perl-crypt-mode-cfb" "perl-crypt-mode-ctr" "perl-crypt-mode-ofb")
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Crypt-OpenSSL-AES-${pkgver}.tar.gz")
sha256sums=('0ea6fa907aa5d5fb568089803433fde60c0ed6a5a39d4bfee131620f7c957ddd')

build() {
  cd Crypt-OpenSSL-AES-${pkgver}

  perl Makefile.PL INSTALLDIRS=vendor

  make
}

package() {
  cd Crypt-OpenSSL-AES-${pkgver}

  make install DESTDIR="$pkgdir"

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}

check() {
  cd Crypt-OpenSSL-AES-${pkgver}
  make test
}
