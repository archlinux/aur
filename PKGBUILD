# Maintainer: Cyrinux <levis dot cyril at gmail dot com>
pkgname=nmtrust-git
pkgver=r24.1dc724e
pkgrel=1
pkgdesc="A simple framework for determining network trust with NetworkMananger"
arch=('any')
depends=('systemd' 'networkmanager')
url="https://github.com/pigmonkey/nmtrust"
license=('GPL')
makedepends=('git')
source=("git://github.com/pigmonkey/nmtrust.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/nmtrust"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/nmtrust"
  install -D -m0755 ${srcdir}/nmtrust/dispatcher/10trust ${pkgdir}/etc/NetworkManager/dispatcher.d/10trust
  install -D -m0755 ${srcdir}/nmtrust/nmtrust ${pkgdir}/usr/bin/nmtrust
  install -D -m0755 ${srcdir}/nmtrust/ttoggle ${pkgdir}/usr/bin/ttoggle
}
