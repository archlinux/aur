# Maintainer: Valere Monseur <valere dot monseur at ymail dot com>
# Contributor: AJ <aj[at]nqrith[dot]com>

pkgname='mtree'
pkgver=1.0.2
pkgrel=1
pkgdesc='Map a directory hierarchy'
arch=('i686' 'x86_64')
url="http://code.google.com/p/mtree-port"
license=('BSD')
depends=('openssl')
source=("https://s3.amazonaws.com/archie-public/mtree-port/${pkgname}-${pkgver}.tar.gz")
md5sums=('d406a51fdf66f89efbdabd295c21b07f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 mtree   "${pkgdir}"/usr/bin/mtree
# install -Dm644 mtree.5 "${pkgdir}"/usr/share/man/man5/mtree.5 ### conflicts with libarchive that already installs mtree.5
  install -Dm644 mtree.8 "${pkgdir}"/usr/share/man/man8/mtree.8
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}
