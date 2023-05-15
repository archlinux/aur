# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>
# Contributor: Martin Peres <martin.peres[at]free[dot]fr>
# Contributor: Timothée Ravier <tim[at]siosm[dot]fr>

pkgname=nouveau-fw
pkgver=340.108
pkgrel=1
pkgdesc="This package provides video & pgraph firmwares for all NVIDIA chipsets that need them"
url='http://nouveau.freedesktop.org/wiki/'
arch=('any')
license=('custom')
makedepends=('python3')
source=("https://raw.githubusercontent.com/envytools/firmware/master/extract_firmware.py"        
"http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}.run")
md5sums=('SKIP'
         'SKIP')
sha256sums=('SKIP'
            'SKIP')

build() {
  sh NVIDIA-Linux-x86_64-${pkgver}.run --extract-only
  python3 extract_firmware.py
}

package() {
  install -dm 0755 "${pkgdir}"/usr/lib/firmware/nouveau/
  cp -a nv* vuc-* "${pkgdir}"/usr/lib/firmware/nouveau/
}

# vim:set ts=2 sw=2 et:
