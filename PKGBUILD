# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Eduardo Leggiero <https://www.leggiero.uk/>

pkgname=perl-ntlm
pkgver=1.09
pkgrel=2
pkgdesc="Perl/CPAN module NTLM"
url="http://search.cpan.org/~nbebout/NTLM/"
license=('GPL')
arch=('any')
source=("http://search.cpan.org/CPAN/authors/id/N/NB/NBEBOUT/NTLM-${pkgver}.tar.gz")
sha512sums=('faae9a4a39f483a9612e5a7daec15bb8ddd940ccc73e52372dd004a9067336fccc4c490deafb3eaa0cf56c0dfe3a085cb6bba38631a5122c2f2fa6e960845039')

build() {
  cd ${srcdir}/NTLM-${pkgver}
  perl Makefile.PL INSTALLSITELIB=/usr/lib/perl5/site_perl/
  make
}

check() {
  cd ${srcdir}/NTLM-${pkgver}
  make test
}

package(){
  cd ${srcdir}/NTLM-${pkgver}
  make DESTDIR=${pkgdir} install
}
