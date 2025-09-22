# Maintainer: Leandro Costa <lokidarkeden@gmail.com>

pkgname=mactelnet
pkgver=0.6.3
pkgrel=1
pkgdesc='A linux console tool for connecting to MikroTik RouterOS devices via their ethernet address'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/haakonnessjoen/MAC-Telnet'
backup=('etc/mactelnetd.users')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1b685568bddfe8d41cf70242a8db98968154334647b2c98c389596604e3fc38a')

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
