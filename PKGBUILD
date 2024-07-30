# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=mactelnet
pkgver=0.5.2
pkgrel=1
pkgdesc='A linux console tool for connecting to MikroTik RouterOS devices via their ethernet address'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/haakonnessjoen/MAC-Telnet'
backup=('etc/mactelnetd.users')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('77f542d47848f1e43ebfc9c9c09b67a74e4d73ee9e45277b8ad5f19fb5e13f2e')

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
