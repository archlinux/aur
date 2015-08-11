# Maintained by Joseph Riches

pkgname=libevdevc
pkgdesc="Chromium OS libevdev"
pkgver=2.0
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/hugegreenbug/libevdevc"
license=('custom:chromiumos')
depends=('glibc')
options=('!emptydirs' '!strip')

source=('ChromiumOS_Licence.txt')
source_x86_64=("${pkgname}_${pkgver}-ubuntu4_amd64.deb::https://launchpad.net/~hugegreenbug/+archive/ubuntu/cmt2/+files/${pkgname}_${pkgver}-ubuntu4_amd64.deb")
source_i686=("${pkgname}_${pkgver}-ubuntu4_i386.deb::https://launchpad.net/~hugegreenbug/+archive/ubuntu/cmt2/+files/${pkgname}_${pkgver}-ubuntu4_i386.deb")

md5sums=('af314be4bf04a749665a07203b120f54')
md5sums_x86_64=('f76beab95337525666e03789bd250c24')
md5sums_i686=('287715207a88d3f213a80d15332133a6')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm644 ChromiumOS_Licence.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENCE
}
