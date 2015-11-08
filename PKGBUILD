#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Pythonless package of a fast, isolated development environments using Docker"
depends=('docker')
arch=('x86_64')
conflicts=('docker-compose')
options=(!strip)
source=(
  "https://github.com/docker/compose/releases/download/$pkgver/docker-compose-Linux-x86_64"
  "https://github.com/docker/compose/archive/$pkgver.tar.gz"
)
url="https://github.com/docker/compose"
license="Apache"
sha256sums=('f920ae9e3907b5007d3d833f1d369f908eeeabf31f292130636102b0c9b6ddf1'
            'd44d7c966c3ec6b2baf493fb8c8f94b0c23cb03609517cc174884c7ff46cf809')

package() {
  cd "$srcdir"
  install -Dm755 docker-compose-Linux-x86_64 "$pkgdir/usr/bin/docker-compose"

  cd "$srcdir/compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/completion/bash/docker-compose "$pkgdir/etc/bash_completion.d/docker-compose"
  install -Dm644 contrib/completion/zsh/_docker-compose "$pkgdir/usr/share/zsh/site-functions/_docker-compose"
}
