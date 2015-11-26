pkgname=smartscope-beta
pkgver=2015.1120.23.22
pkgrel=1
pkgdesc="SmartScope App (Beta version)"
arch=('x86_64' 'i686')
url="https://www.lab-nation.com/"
license=('unknown')
depends=('mono' 'sdl_mixer' 'libusb')
conflicts=('smartscope')
provides=('smartscope')
makedepends=('tar')

_pkgver=$(echo ${pkgver} | sed 's@\.@/@g')

source=("$pkgname.deb::https://www.lab-nation.com/package/smartscope/${_pkgver}/linux/get"
        'smartscope.sh')
md5sums=('a610c6c75aa34668b029c36106bde047'
         '3d877cb9f75a3ef8887e1f81b69e8007')

package() {
  cd "${srcdir}"
  tar -xJvf data.tar.xz -C "${pkgdir}"
  install -D -m755 smartscope.sh "${pkgdir}/usr/bin/smartscope"
}

# vim: set ts=2 sw=2 et:
