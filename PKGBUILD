# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=xattr
pkgname=php-${_pkgname}
pkgver=1.3.0
pkgrel=1
pkgdesc="PHP extension that allows to manipulate extended attributes on filesystems that support them"
arch=('i686' 'x86_64')
license=('PHP')
url='https://pecl.php.net/package/xattr'
depends=('php')
source=("https://pecl.php.net/get/${_pkgname}-${pkgver}.tgz")
md5sums=('f84aa0ae77f6935af7b5a4fef800ee70')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
}
