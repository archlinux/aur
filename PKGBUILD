# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=imapsync
pkgver=1.836
pkgrel=2
pkgdesc='IMAP synchronisation, sync, copy or migration tool'
arch=('any')
url='http://www.linux-france.org/prj/'
license=('GPL')
depends=('perl-data-uniqid' 'perl-date-manip' 'perl-file-copy-recursive' 'perl-html-parser'
          'perl-io-socket-inet6' 'perl-io-socket-ssl' 'perl-io-tee' 'perl-json-webtoken' 'perl-libwww'
          'perl-module-scandeps' 'perl-mail-imapclient' 'perl-ntlm' 'perl-par-packer' 'perl-readonly'
          'perl-sys-meminfo' 'perl-term-readkey' 'perl-test-mockobject' 'perl-test-pod' 'perl-unicode-string')
makedepends=('time')
source=(https://github.com/imapsync/imapsync/archive/${pkgname}-${pkgver}.tar.gz)
sha512sums=('f1ea1ef887ebcfa62c90254b3738602dc78275400a7d8dd5af33bc399c82c28d8567ee42d9ebf85735e7df857bf548608e09f01a06bd146f317faa3b4702cbeb')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
