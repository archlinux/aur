# Maintainer: Balazs Vinarz <vinibali1 at gmail dot com>

pkgname=linux-firmware-minimal
pkgver=20100519
pkgrel=2
pkgdesc="Minimal amount of firmware files for Linux, mostly recommended for virtual systems."
arch=('any')
url="https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/"
license=('GPL2' 'GPL3' 'MIT' 'custom')
conflicts=('linux-firmware-git'
           'linux-firmware')
options=(!strip)
source=(https://mirrors.sohu.com/archlinux/other/linux-firmware/linux-firmware-$pkgver.tar.xz)
sha256sums=('2c0d22e9ce469d8095c1c4921350ea6021088ce21b5a46139f4ed8c6003dad01')

build() {
  :
}

package() {
  cd "${srcdir}/linux-firmware-${pkgver}"

  install -d -m755 "${pkgdir}/lib/firmware"
  cp -a * "${pkgdir}/lib/firmware/"
  install -d -m755 "${pkgdir}/usr/share/licenses/linux-firmware/"
  mv "${pkgdir}/lib/firmware"/LICEN* "${pkgdir}/usr/share/licenses/linux-firmware/"
}
# vim:set ts=2 sw=2 et:
