# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=mactelnet
pkgver=0.5.0
pkgrel=1
pkgdesc='A linux console tool for connecting to MikroTik RouterOS devices via their ethernet address'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/haakonnessjoen/MAC-Telnet'
backup=('etc/mactelnetd.users')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('697d2ddcd12428f7b5fa0233e2bc84da6a98f4180961ed2ebeae0b5df08ffa00')

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
