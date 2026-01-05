# Maintainer: Maxim Balashov <rsg245@yandex.com>

pkgname=portablemc-bin
pkgver=5.0.1
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

sha256sums=('828e7537df32b1a8aeb670f5ded91af5e54f618921fb93957006c59fe7f5f569'
	    'bbc1cd9d525d0b41b68ea3124498411a79dfecc3a9ad47f2c28d04a8f3554556')

package() {
  cd "portablemc-${pkgver}-linux-x86_64"
  install -dm 755 ${pkgdir}/usr/bin
  install -Dm755 "${srcdir}/portablemc-${pkgver}-linux-x86_64/portablemc" "${pkgdir}/usr/bin/portablemc"  
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
  #install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
