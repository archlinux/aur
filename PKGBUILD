# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=imapsync
pkgver=1.727
pkgrel=1
pkgdesc="IMAP synchronisation, sync, copy or migration tool"
arch=('any')
url="http://www.linux-france.org/prj/"
license=('GPL')
depends=('perl-date-manip' 'perl-mail-imapclient' 'perl-term-readkey' 'perl-io-socket-ssl' 
         'perl-file-copy-recursive' 'perl-io-tee' 'perl-unicode-string' 'perl-data-uniqid' 
         'perl-io-socket-inet6' 'perl-json-webtoken' 'perl-readonly' 'perl-ntlm' 
         'perl-test-mockobject' 'perl-test-pod')
makedepends=('time')
source=("https://github.com/$pkgname/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('b5ab0f3b4ae12d9d65d5c65e65fa5778ade5ac68432523fcb6839e84af742abf5a3ca0a04d3308936c7b99f16415b9d8076f96ec37d84e82dcdf53413f625e75')

build() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
  make
}

check() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
  make test
}

package() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
