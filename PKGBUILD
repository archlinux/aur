# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Eduardo Leggiero <https://www.leggiero.uk/>

pkgname=perl-ntlm
pkgver=1.09
pkgrel=3
pkgdesc='Perl/CPAN module NTLM'
arch=('any')
url='http://search.cpan.org/~nbebout/NTLM/'
license=('GPL')
makedepends=('perl-digest-hmac')
source=("http://search.cpan.org/CPAN/authors/id/N/NB/NBEBOUT/NTLM-${pkgver}.tar.gz")
sha512sums=('faae9a4a39f483a9612e5a7daec15bb8ddd940ccc73e52372dd004a9067336fccc4c490deafb3eaa0cf56c0dfe3a085cb6bba38631a5122c2f2fa6e960845039')

build() {
  cd NTLM-${pkgver}
  perl Makefile.PL
  make
}

check() {
  cd NTLM-${pkgver}
  make test
}

package(){
  cd NTLM-${pkgver}
  make DESTDIR="${pkgdir}" install
}
