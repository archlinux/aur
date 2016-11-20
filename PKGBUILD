# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=perl-json-webtoken
pkgver=0.10
pkgrel=1
pkgdesc="Perl/CPAN module JSON WebToken"
arch=('any')
url="http://search.cpan.org/~xaicron/JSON-WebToken/"
license=('GPL')
makedepends=('perl-module-build')
source=("http://search.cpan.org/CPAN/authors/id/X/XA/XAICRON/JSON-WebToken-${pkgver}.tar.gz")
sha512sums=('ce4acd42814db12fc16c60a8937a4e7d420b0243c3ca26f96a36ee2a2fb4a14f93538340b199fcce9cfbb090d60de5d7e24d5f008a84e1365d7c31f6db9ee312')

build() {
  cd ${srcdir}/JSON-WebToken-${pkgver}
  perl Build.PL INSTALLSITELIB=/usr/lib/perl5/site_perl/
  ./Build
}

package(){
  install -d -m 755 ${pkgdir}/usr/lib/perl5/site_perl/
  install -d -m 755 ${pkgdir}/usr/share/man/man3/

  cp -a ${srcdir}/JSON-WebToken-${pkgver}/blib/lib/JSON ${pkgdir}/usr/lib/perl5/site_perl/
  install -D -m 644 ${srcdir}/JSON-WebToken-${pkgver}/blib/libdoc/JSON::WebToken.3pm ${pkgdir}/usr/share/man/man3/
}
