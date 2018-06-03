# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: shild <sxp@bk.ru>

pkgname=centerim
pkgver=5.0.1
pkgrel=1
pkgdesc="Fork of CenterICQ - A text mode menu- and window-driven IM interface"
arch=('x86_64')
url="http://www.centerim.org"
license=('GPL')
depends=('python2' 'libjpeg' 'gpgme' 'libpurple' 'ncurses' 'libsigc++')
makedepends=('ca-certificates')
replaces=('centericq')
source=(http://www.centerim.org/download/cim5/${pkgname}5-${pkgver}.tar.gz)
md5sums=('dfd17684eccbf5819038517b0d369913')

prepare() {
  cd "${pkgname}5-${pkgver}"
  ./bootstrap
}

build() {
  cd "${pkgname}5-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}5-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
