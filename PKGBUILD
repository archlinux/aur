#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>
pkgname=rocker-compose-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Docker composition tool with idempotency features for deploying apps composed of multiple containers"
depends=( )
arch=('x86_64')
conflicts=('rocker-compose')
options=( )
source=(
  "https://github.com/grammarly/rocker-compose/releases/download/${pkgver}/rocker-compose-${pkgver}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/grammarly/rocker-compose/master/LICENSE"
  "https://raw.githubusercontent.com/alkersan/rocker-compose/master/completion/zsh/_rocker-compose"
)
url="https://github.com/grammarly/rocker-compose"
license="Apache"
sha256sums=('b1434bef6012eb6c04b66737cd5d9df45678b2cdb6dde739bcabfbe0739259eb'
            '58f1fbfa93dd08a1b77a80dd5821c6e8cf025d54831c43e8235a280d512fb62b'
            '8638e056f958beac508f4c5e19dd23fc0395cae9257a7400127612b04fede2d0')

package() {
  cd "$srcdir"
  install -Dm755 rocker-compose "$pkgdir/usr/bin/rocker-compose"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rocker-compose/LICENSE"
  install -Dm644 _rocker-compose "$pkgdir/usr/share/zsh/site-functions/_rocker-compose"
}
