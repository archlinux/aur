pkgname=mbw
pkgver=2.0
pkgrel=1
pkgdesc="MBW determines the "copy" memory bandwidth available to userspace programs. Its simplistic approach models that of real applications. It is not tuned to extremes and it is not aware of hardware architecture, just like your average software package."
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/raas/mbw"
makedepends=('make')
license=('GPLv3')
source=("https://github.com/raas/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('46ca7401ae650734965e7a25453557d4')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
