# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=boltbrowser
pkgver=2.2
pkgrel=2
pkgdesc="Lightweight CLI browser for BoltDB files"
arch=('x86_64' 'armv7h')
url="https://github.com/br0xen/boltbrowser"
license=('GPL-3.0-only')
options=('!debug')
# Upstream ships static prebuilt binaries only; there is no 64-bit ARM build
# (boltbrowser.linuxarm is 32-bit ARM EABI5, hence armv7h, not aarch64).
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/${pkgver}/boltbrowser.linux64")
source_armv7h=("${pkgname}-${pkgver}-armv7h::${url}/releases/download/${pkgver}/boltbrowser.linuxarm")
sha256sums_x86_64=('7747926b067bbb8bdf3bbc25102ffe98b1ad4fee9d237f61b32f2e0800cd55d9')
sha256sums_armv7h=('4be06b2d37c02107469b6538a4e5275762e2afe029bfb08e17b39186e9b032eb')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/boltbrowser"
}
