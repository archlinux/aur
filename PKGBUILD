# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=mactelnet
pkgver=0.5.1
pkgrel=1
pkgdesc='A linux console tool for connecting to MikroTik RouterOS devices via their ethernet address'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/haakonnessjoen/MAC-Telnet'
backup=('etc/mactelnetd.users')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('38967c20741f0e49d2aa5a39a94b80353587b5c5c6ced5082892f6a9929043e5')

prepare() {
  cd ${srcdir}/MAC-Telnet-${pkgver}/

  ./autogen.sh
}

build() {
  cd ${srcdir}/MAC-Telnet-${pkgver}/

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc
  make
}

package() {
  cd ${srcdir}/MAC-Telnet-${pkgver}/

  make DESTDIR="${pkgdir}" install
}
