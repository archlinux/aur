#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-bin
pkgver=1.6.2
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
license=("Apache")
sha256sums=('7c453a3e52fb97bba34cf404f7f7e7913c86e2322d612e00c71bd1588587c91e'
            '1c318cdf12bdc97e079224fb0cab45ed0f6ec2d1ce87599eff549b1aafa27837')

package() {
  cd "$srcdir"
  install -Dm755 docker-compose-Linux-x86_64 "$pkgdir/usr/bin/docker-compose"

  cd "$srcdir/compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/completion/bash/docker-compose "$pkgdir/etc/bash_completion.d/docker-compose"
  install -Dm644 contrib/completion/zsh/_docker-compose "$pkgdir/usr/share/zsh/site-functions/_docker-compose"
}
