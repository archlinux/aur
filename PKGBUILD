# Maintainer: Christian Petrov <christian.petrov@outlook.com>

_pkgbase=deft
pkgname=deft-dkms
pkgver=1.0.2
pkgrel=1
pkgdesc='A Linux loadable kernel module for the Elecom DEFT series finger operated trackballs'
arch=('any')
url='https://github.com/cpetrov/deft'
license=('GPL3')
depends=('dkms')
source=("https://github.com/cpetrov/deft/releases/download/v$pkgver/$_pkgbase-$pkgver.tar.xz")
md5sums=('0fad5631b1a88554abca71362989d5b8')

package() {
  install -dm 755 "${pkgdir}"/{usr/src/"${_pkgbase}-${pkgver}",usr/lib/udev/rules.d,usr/bin,etc/depmod.d}
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  cp -a ./* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  install -m 644 hid-deft.conf "${pkgdir}/etc/depmod.d/hid-deft.conf"
  install -m 644 hid-rebind "${pkgdir}/usr/bin/hid-rebind"
  install -m 644 90-hid-rebind.rules "${pkgdir}/usr/lib/udev/rules.d/90-hid-rebind.rules"
}
