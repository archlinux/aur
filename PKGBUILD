# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=php-mailparse
pkgver=2.1.6
pkgrel=3
pkgdesc="Extension for parsing and working with email messages (RFC822 and RFC2045)"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/mailparse"
license=('PHP')
depends=('php')
source=("http://pecl.php.net/get/mailparse-${pkgver}.tgz")
sha256sums=('73705197d2b2ee782efa5477eb2a21432f592c2cb05a72c3a037bbe39e02b5cc')

build() {
  cd "${srcdir}/mailparse-${pkgver}/"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/mailparse-${pkgver}/"

  make INSTALL_ROOT="${pkgdir}/" install
}
