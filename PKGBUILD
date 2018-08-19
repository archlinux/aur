# Maintainer: Thomas Gerbet <thomas at gerbet dot me>
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>

pkgname=php-mailparse
pkgver=3.0.2
pkgrel=1
pkgdesc="Extension for parsing and working with email messages (RFC822 and RFC2045)"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/mailparse"
license=('PHP')
depends=('php>=7.0.0')
source=("http://pecl.php.net/get/mailparse-${pkgver}.tgz")
sha256sums=('d81a6f8a48e43fca1c0f0d6c90d666830c24d584a23a60add43062aaf221843b')

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
