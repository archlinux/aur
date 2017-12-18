# Maintainer: Andrey Rodionov <roand@inbox.ru>
pkgname=pam_e4crypt
pkgver=0.1
pkgrel=3
pkgdesc='This is a PAM module for unlocking transparently encrypted directories on ext4'
url="https://github.com/neithernut/pam_e4crypt/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('keyutils' 'linux>=4.1' 'openssl' 'pam' 'util-linux')
makedepends=('cmake')
source=("https://github.com/neithernut/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake .
    make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
