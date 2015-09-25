#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=docker-compose-bin
pkgver=1.4.2
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
sha256sums=('d5fca08d54f59649b93b66a781b22998955f2bd701244fcfd650c00daa9e948c'
            'cc11f8281f0cf99fcb5502edb6e0d49caca26f4a11570b8ad68943bd3a97dd5c')

package() {
  cd "$srcdir"
  install -Dm755 docker-compose-Linux-x86_64 "$pkgdir/usr/bin/docker-compose"

  cd "$srcdir/compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/completion/bash/docker-compose "$pkgdir/etc/bash_completion.d/docker-compose"
  install -Dm644 contrib/completion/zsh/_docker-compose "$pkgdir/usr/share/zsh/site-functions/_docker-compose"
}
