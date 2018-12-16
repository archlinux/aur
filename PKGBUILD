# Maintainer: Nachoc <nachohc89 at gmail dot com>

_pkgbase=8192eu
pkgname=8192eu-dkms
pkgver=54.6315416
pkgrel=1
pkgdesc="Driver for the Realtek 8192eu chipset (DKMS)"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/Mange/rtl8192eu-linux-driver"
license=('GPL')
depends=('dkms')
provides=('rtl8192eu')
source=("$_pkgbase::git+https://github.com/Mange/rtl8192eu-linux-driver.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgbase"
  install -dm755 "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
  cp -r ${srcdir}/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
