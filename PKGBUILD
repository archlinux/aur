# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Joey Mazzarelli <mazzarelli at gmail dot com>

pkgname=cdw
pkgver=0.8.1
pkgrel=1
pkgdesc="Ncurses CD writer program which uses cdrecord and mkisofs"
arch=('i686' 'x86_64')
url="http://cdw.sourceforge.net/"
license=('GPL')
depends=('cdrtools' 'ncurses' 'libburn' 'libcdio')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}%20${pkgver}/${pkgname}-${pkgver}.tar.gz/download)
md5sums=('9e6b5c2bbe54e8f1dc0d20e3cb966e5c')


build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make prefix="${pkgdir}"/usr install

  install -dm755 "${pkgdir}"/usr/share/doc/cdw
  install -m644 cdw.conf "${pkgdir}"/usr/share/doc/cdw
  install -m644 cdw.colors "${pkgdir}"/usr/share/doc/cdw
}
