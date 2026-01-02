# Maintainer: Maxim Balashov <rsg245@yandex.com>

pkgname=portablemc-bin
pkgver=5.0.0
pkgrel=1
pkgdesc='Cross platform command line utility for launching Minecraft quickly and reliably with included support for Mojang versions and popular mod loaders.'
arch=(x86_64)
url='https://github.com/mindstorm38/portablemc'
license=('Apache-2.0')
depends=(
  gcc-libs
  glibc
  libxcb
  openssl
)

provides=('portablemc')
conflicts=('portablemc')

validpgpkeys=('F659B0F0B84A26CAC635D72948CAEE8DC3456B2F')

source=("${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-x86_64.tar.gz"
	"${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-x86_64.tar.gz.sig")

sha256sums=('88224f3d89f798fcfe97d61a6db4078262eaa9fcb5549c950801937b418e6b81'
	    '5b2161c1ecec7cc9450847015a79b625ceb0f404bc75f3ac7117fd9c4c507c7e')

package() {
  cd "portablemc-${pkgver}-linux-x86_64"
  install -dm 755 ${pkgdir}/usr/bin
  install -Dm755 "${srcdir}/portablemc-${pkgver}-linux-x86_64/portablemc" "${pkgdir}/usr/bin/portablemc"  
  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
  #install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
