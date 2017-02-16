pkgname=smartscope-beta
pkgver=2017.0216.0150.00
pkgrel=1
pkgdesc="SmartScope App (Beta version)"
arch=('x86_64' 'i686')
url="https://www.lab-nation.com/"
license=('unknown')
depends=('mono' 'sdl_mixer' 'libusb')
conflicts=('smartscope')
provides=('smartscope')
makedepends=('tar')

source=("${pkgname}.deb::https://www.lab-nation.com/package/smartscope/linux/latest_unstable/get"
        'smartscope.sh')
md5sums=('SKIP'
         '3d877cb9f75a3ef8887e1f81b69e8007')

pkgver() {
  tar -xzOf control.tar.gz ./control | sed -n 's/^Version: //p'
}

package() {
  cd "${srcdir}"
  tar -xJvf data.tar.xz -C "${pkgdir}"
  install -D -m755 smartscope.sh "${pkgdir}/usr/bin/smartscope"
}

# vim: set ts=2 sw=2 et:
