# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=xattr
pkgname=php-${_pkgname}
pkgver=1.4.0
pkgrel=1
pkgdesc="PHP extension that allows to manipulate extended attributes on filesystems that support them"
arch=('i686' 'x86_64')
license=('PHP')
url='https://pecl.php.net/package/xattr'
depends=('php')
source=("https://pecl.php.net/get/${_pkgname}-${pkgver}.tgz")
sha256sums=('744d2a3f1469de6d3b5f30b5b17095efc714c5f71c8af3734afdd9e4819c140b')

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
