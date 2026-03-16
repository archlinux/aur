pkgname=echomusic-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="🎉 一个简约的第三方酷狗概念版音乐播放器 "
arch=('x86_64')
url="https://github.com/hoowhoami/EchoMusic"
license=('Apache')
depends=('glibc')
provides=('echomusic')
conflicts=('echomusic')
source=("EchoMusic-$pkgver-Linux.deb::https://github.com/hoowhoami/EchoMusic/releases/download/v$pkgver/EchoMusic-$pkgver-Linux.deb")
sha256sums=('SKIP')
package() {
  cd "$srcdir"

  bsdtar -xf EchoMusic-$pkgver-Linux.deb
  bsdtar -xf data.tar.* -C "$pkgdir"

  # 软链接
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/echomusic/echomusic "$pkgdir/usr/bin/echomusic"
}