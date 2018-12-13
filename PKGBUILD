# Maintainer: Chris Lahaye <dev@chrislahaye.com>
pkgname=ecs-deploy
pkgver=3.0.65.gda39f64
pkgrel=1
pkgdesc="Simple shell script for initiating blue-green deployments on Amazon EC2 Container Service (ECS)"
url="https://github.com/silinternational/ecs-deploy/"
arch=('any')
license=('custom')
depends=('bash')
source=("ecs-deploy::git+https://github.com/silinternational/ecs-deploy#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}
