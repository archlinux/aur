# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=php-mailparse
pkgver=3.0.0
pkgrel=1
pkgdesc="Extension for parsing and working with email messages (RFC822 and RFC2045)"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/mailparse"
license=('PHP')
depends=('php>=7.0.0')
source=("http://pecl.php.net/get/mailparse-${pkgver}.tgz")
sha256sums=('92a80f7d2cda597ca75186531006b802fa278f33d1b3b854420f48832e5bc7da')

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
