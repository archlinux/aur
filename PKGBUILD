# Maintainer: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>
pkgname=cow-proxy
pkgver=0.9.6
pkgrel=1
pkgdesc="HTTP proxy written in Go. COW can automatically identify blocked sites and use parent proxies to access"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv7l')
url="https://github.com/cyfdecyf/cow"
license=('custom')
depends=()
makedepends=()
conflicts=(cow-proxy-git)

source=(cow@.service
        cow_user.service)
source_x86_64+=(cow-x86_64-$pkgver.gz::http://dl.chenyufei.info/cow/latest/cow-linux64-$pkgver.gz)
source_i686+=(cow-i686-$pkgver.gz::http://dl.chenyufei.info/cow/latest/cow-linux32-$pkgver.gz)
source_armv5tel+=(cow-armv5tl-$pkgver.gz::http://dl.chenyufei.info/cow/latest/cow-linux-armv5tel-$pkgver.gz)
source_armv6l+=(cow-armv6l-$pkgver.gz::http://dl.chenyufei.info/cow/latest/cow-linux-armv6l-$pkgver.gz)
source_armv7l+=(cow-armv7l-$pkgver.gz::http://dl.chenyufei.info/cow/latest/cow-linux-armv7l-$pkgver.gz)

sha1sums=('3efa6f55e51bed4043ac7a5804469bdd38032359'
          'ee250fdebc73255effd6219d0d8089990c9c73bd')
sha1sums_i686=('89e6591eb92a377eb5013ec10c1f9495ba0430a8')
sha1sums_x86_64=('315f24d7e21c551a9b91f06de8243557817e19a4')
sha1sums_armv5tel=('2fe2b89eebad4582384708a1d810d75c82d966b5')
sha1sums_armv6l=('5dded225232b1755e09f2d647ac5ebce3284e378')
sha1sums_armv7l=('675e242e82f3d64c0cabfc426e4ccbe891707095')

install=$pkgname.install

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/cow-$CARCH-$pkgver $pkgdir/usr/bin/cow
  install -Dm644 cow@.service ${pkgdir}/usr/lib/systemd/system/cow@.service
  install -Dm644 cow_user.service ${pkgdir}/usr/lib/systemd/user/cow.service
}
