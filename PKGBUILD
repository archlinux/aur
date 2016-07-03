# Maintainer: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>
pkgname=cow-proxy
pkgver=0.9.8
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
source_x86_64+=(cow-x86_64-$pkgver.gz::https://github.com/cyfdecyf/cow/releases/download/$pkgver/cow-linux64-$pkgver.gz)
source_i686+=(cow-i686-$pkgver.gz::https://github.com/cyfdecyf/cow/releases/download/$pkgver/cow-linux32-$pkgver.gz)
source_armv5tel+=(cow-armv5tl-$pkgver.gz::https://github.com/cyfdecyf/cow/releases/download/$pkgver/cow-linux-armv5tel-$pkgver.gz)
source_armv6l+=(cow-armv6l-$pkgver.gz::https://github.com/cyfdecyf/cow/releases/download/$pkgver/cow-linux-armv6l-$pkgver.gz)
source_armv7l+=(cow-armv7l-$pkgver.gz::https://github.com/cyfdecyf/cow/releases/download/$pkgver/cow-linux-armv7l-$pkgver.gz)

sha1sums=('3efa6f55e51bed4043ac7a5804469bdd38032359'
          'ee250fdebc73255effd6219d0d8089990c9c73bd')
sha1sums_i686=('041c64d7ad5d0e49b379036131eb7d7a21e89c84')
sha1sums_x86_64=('967e071b4d2df2a358e4d150d80e523496dfa866')
sha1sums_armv5tel=('5489c82444754caa19c723a54c2107ff0a3970a8')
sha1sums_armv6l=('124c9a4fadc494b3afd407121f05e9126f7934f1')
sha1sums_armv7l=('8ffdeb4c596e105aaf9c35b60c09aa1e42f75830')

install=$pkgname.install

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/cow-$CARCH-$pkgver $pkgdir/usr/bin/cow
  install -Dm644 cow@.service ${pkgdir}/usr/lib/systemd/system/cow@.service
  install -Dm644 cow_user.service ${pkgdir}/usr/lib/systemd/user/cow.service
}
