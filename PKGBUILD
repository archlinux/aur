# Maintainers:
# Jonas Gierer <jonas@gierer.xyz>
# Ujjwal Sharma <ryzokuken@disroot.org>
# Elias Blume <mail at elias-blu.me>
pkgname=mdloader-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Massdrop Firmware Loader"
arch=('x86_64')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
makedepends=('unzip')
license=('GPL')
url="https://github.com/Massdrop/mdloader"
source=("${pkgname%-bin}-$pkgver.zip::https://github.com/Massdrop/mdloader/releases/download/${pkgver}/mdloader-Linux.zip")
md5sums=('f2856e4f70e6e34ff7e4b7daba6d7f88')

prepare() {
  # unzip
  unzip ${pkgname%-bin}-$pkgver.zip

}

package() {
  install -m0755 ${pkgname%-bin} -D $pkgdir/usr/bin/${pkgname%-bin}
}
