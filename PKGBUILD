pkgname=particlemusic-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A cross-platform local music player based on Flutter"
arch=('x86_64')
url="https://github.com/AfalpHy/ParticleMusic"
license=('Apache')
depends=('glibc')
provides=('particlemusic')
conflicts=('particlemusic')
source=("ParticleMusic-$pkgver-linux-amd64.deb::https://github.com/AfalpHy/ParticleMusic/releases/download/v$pkgver/ParticleMusic-$pkgver-linux-amd64.deb")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  # 解包 deb
  bsdtar -xf ParticleMusic-$pkgver-linux-amd64.deb

  # 解 data 部分
  bsdtar -xf data.tar.* -C "$pkgdir"
}
